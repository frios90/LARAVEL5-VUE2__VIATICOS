<template >
  <div class="content-wrapper">
    <div v-if="loader" class="loader"></div>
    <div class="row">
      <div class="col-md-12 grid-margin">
        <div class="d-flex justify-content-between flex-wrap">
          <div class="align-items-end flex-wrap">
            <view-navigation :list="'catalogue_rates'"></view-navigation>
            <div class="mr-md-3 mr-xl-5">
              <h2>Banco de tarifas para la empresa [ {{ catalogue }} ]</h2>
              <p class="mb-md-0 p-description-module">
                Módulo para el registro de tarifas relacionadas a el empresa seleccionada.
                En este módulo podrá detallar cada uno de los servicios que ofrece un empresa 
                en particular, con el fin de realizar estimaciones de gastos para una solicitud
                lo mas cercanas la realidad posible. 
              
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="grid-margin stretch-card">
      <div class="card">
        <p class="card-title">
            <button class="btn-approve-item float-right mdi mdi-check" title="Guardar cambios" @click="postRequestCreate"></button>
            <router-link to="/catalogue">
              <button class="btn-back-item float-right mdi mdi-arrow-left" title="Volver al menu anterior" ><a href=""></a></button>
            </router-link> 
          </p>
          <div class="card-body">
              <form class="forms-sample">
                  <div class="row">
                      <div class="form-group col-md-6">
                          <label for="">Descripción</label>
                          <span class="mdi mdi-alert-circle circle-info" title="Ingrese la Descripción de la Tarifa a crear"></span>
                          <input type="text" class="form-control form-control-sm" v-model="description" name="label">
                          <span class="errors" v-if="errors && errors.description">{{errors.description[0] }}</span>
                      </div>    
                  </div>
                  <div class="row">
                      <div class="form-group col-md-6">
                          <label for="">Valor</label>
                          <span class="mdi mdi-alert-circle circle-info" title="Ingrese el Valor Unitario para esta Tarifa."></span>
                          <input type="text" class="form-control form-control-sm" v-model="value" name="value">
                          <span class="errors" v-if="errors && errors.value">{{errors.value[0] }}</span>
                      </div>                           
                  </div>                        
              </form>
          </div>   
          <div class="card-body">
              <table class="table table-sm table-bordered">
                <thead class="">
                  <tr class="">
                    <th class="">Descripción</th>
                    <th>Valor</th>
                    <th></th>
                  </tr>
                </thead>
                <tbody class="">
                  <tr v-for="(rate, key) in rates" :key="key" class="">
                    <td class="">{{ rate.description }}</td>
                    <td class="" style="text-align: right">{{ rate.value| currency }}</td>
                    <td class="">
                      <i v-if ="!rate.deleted_at" class="mdi mdi-tooltip-edit hover-cursor icon-edit" @click="setEdit(rate)"></i>
                      <i v-if ="!rate.deleted_at" class="mdi mdi-checkbox-marked-circle hover-cursor" @click="changeStatus(rate.id)"></i>
                      <i v-else class="mdi mdi-checkbox-blank-circle hover-cursor" @click="changeStatus(rate.id)"></i>    

                    </td>
                  </tr>
                </tbody>
              </table>
          </div>        
      </div>
    </div>
  </div>
</template>
<script>
import Util from '../../mixins/Util.js'
export default {
  mixins: [Util],
  data() {
    return {
      id               : this.$route.params.id,     
      errors           : {},
      description      : "",
      value            : "",
      rates            : {},
      catalogue        : {},
      id_to_edit       : 0,
      create_or_update : 'create',

    };
  },
  created() {
    this.getCatalogue()
    this.getRates()
  },
  methods: {
    setEdit (rate) {
      this.description      = rate.description
      this.value            = rate.value
      this.id_to_edit       = rate.id
      this.create_or_update = 'update'
    },
    getCatalogue() {
      var self = this;
      this.$http.get("/get-catalogue", { params: { id: self.id } }).then(
        response => {
          this.catalogue = response.body.name
        },
        response => {
          self.$toasted.global.APP_GENERAL_ERROR();
        }
      )
    },
    getRates() {
      var self = this
      this.$http.get("/get-catalogue-rates", { params: { id: self.id } }).then(
        response => {
          self.rates = response.body
          self.loader = false
        },
        response => {
          self.$toasted.global.APP_GENERAL_ERROR();
        }
      )
    },
    postRequestCreate() {
      var data = {
        _token           : this.csrf,
        management_id    : this.id,
        description      : this.description,
        value            : this.value,
        id_to_edit       : this.id_to_edit,
        create_or_update : this.create_or_update
      }
      var  self = this
      this.$http.post('/catalogue-rates', data)
        .then(response => {
            self.$toasted.global.APP_GENERAL_SUCCESS()
            self.errors           = {}
            self.rates            = response.body
            self.create_or_update = 'create'
            self.description      = ''
            self.value            = ''
          }, response => {                 
              if (response.status === 422) {
                self.$toasted.global.APP_GENERAL_ERROR_FORM()
                self.errors = response.body.errors
              }else{
                self.$toasted.global.APP_GENERAL_ERROR()
              }
          })
    },
    changeStatus (rate_id) {
      event.preventDefault()
      var data = {
          _token        : this.csrf,
          id            : rate_id,
          management_id : this.id
        }
      var self = this  
      this.$http.post('/rate-status', data)
      .then(response => {
          self.rates = response.body
          self.$toasted.global.APP_GENERAL_SUCCESS()
        }, response => {                 
            self.$toasted.global.APP_GENERAL_ERROR()
        })
    }  
  },
  filters: {
    upper: function(value) {
      return value.toUpperCase();
    }
  }
};
</script>

@endsection
