<template >     
  <div class="content-wrapper">
    <div v-if="loader" class="loader"></div>
    <div class="row">
      <div class="col-md-12 grid-margin">
        <div class="d-flex justify-content-between flex-wrap">
          <div class=" align-items-end flex-wrap">
            <view-navigation :list="'viatics_index'"></view-navigation>
            <div class="mr-md-3 mr-xl-5">
              <h2>Banco de Viáticos</h2>
              <p class="mb-md-0 p-description-module">
                Módulo para la gestión de tipo de víaticos que se necesiten para determinados eventos, 
                como por ejemplo:
                Buses, Hostales, Lineas Aereas.
                Estos servirán para agrupar las distintas empresas preveedoras de servicios
                requeridos.
              </p>
            </div>            
          </div>
        </div>
      </div>
    </div>
    <div class="grid-margin stretch-card">           
      <div class="card">
        <p class="card-title">
          <router-link :to="{ name: 'viatic.create' }">
            <button class="btn-approve-item float-right mdi mdi-plus" title="Nuevo" ><a href=""></a></button>
          </router-link> 
        </p> 
        <div class="card-body">
          <p class="card-title"></p>
          <div id="people">
            <v-client-table class="index-table" :data="tableData" :columns="columns" :options="options">
              <span slot="actions" slot-scope="props">
                <router-link v-if ="!props.row.deleted_at" :to="'/viatics/edit/'+ props.row.id"><i class="mdi mdi-tooltip-edit hover-cursor icon-edit "></i></router-link>
                <i v-if ="!props.row.deleted_at" class="mdi mdi-checkbox-marked-circle hover-cursor" @click="changeStatus(props.row.id)"></i>
                <i v-else class="mdi mdi-checkbox-blank-circle hover-cursor" @click="changeStatus(props.row.id)"></i>                  
              </span>                                                     
            </v-client-table>
          </div>
        </div> 
      </div>  
    </div>
  </div>          
</template>
<script>
  import Table from '../../mixins/Table.js'
  import Util from '../../mixins/Util.js'
  export default {      
    mixins: [Table, Util],
    data () {
      return {                
      }
    },
    created () {
        this.getDataTable('/viatics-table-list')
        this.columns          =  [ 'label', 'name', 'type.label', 'actions']
        this.options.headings = {                
              name         : 'Código',
              label        : 'Nombre',
              'type.label' : 'Tipo',                   
              actions      : '',
        }
        this.options.sortable = ['label']
    },
    methods: {        
      changeStatus (id) {
        event.preventDefault()
        var data = {
            _token : this.csrf,
            id     : id            
          }
        var self = this  
        this.$http.post('/viatic-status', data)
        .then(response => {
          this.getDataTable('/viatics-table-list')
            self.$toasted.global.APP_GENERAL_SUCCESS()
            self.errors = {}
          }, response => {                 
              self.$toasted.global.APP_GENERAL_ERROR()
          })
      }          
    }
  }
</script>
@endsection
<style>

