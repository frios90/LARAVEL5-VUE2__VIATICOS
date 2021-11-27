<template >
  <div class="content-wrapper">
    <div v-if="loader" class="loader"></div>
    <div class="row">
      <div class="col-md-12 grid-margin">
        <div class="d-flex justify-content-between flex-wrap">
          <div class="align-items-end flex-wrap">
            <view-navigation :list="'catalogue_edit'"></view-navigation>
            <div class="mr-md-3 mr-xl-5">
              <h2>Editar Registro [ {{ rut }} ] [ {{ name }} ]</h2>
              <p class="mb-md-0 p-description-module">Formulario para la <b>Edición</b> de un <b>Registro</b> en <b>Banco de Tarifas</b></p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="grid-margin stretch-card">
      <div class="card">
        <p class="card-title">
            <button class="btn-approve-item float-right mdi mdi-check" title="Guardar" @click="postRequestCreate"></button>
            <router-link to="/catalogue">
              <button class="btn-back-item float-right mdi mdi-arrow-left" title="Volver" ><a href=""></a></button>
            </router-link> 
        </p>
        <div class="card-body">
          <form class="forms-sample">
            <div class="row">
              <div class="form-group col-md-3">
                <label for>Tipo</label>
            <select class="form-control form-control-sm" v-model="code_id" name="code_id">
                  <option
                    v-for="(list, index) in code_list"
                    :key="index"
                    :value="list.id"
                  >{{ list.label }}</option>
                </select>
                <span class="errors" v-if="errors && errors.code_id">{{errors.code_id[0] }}</span>
              </div>
              <div class="form-group col-md-3">
                <label for>Rut</label>
            <input
                  type="text"
                  class="form-control form-control-sm"
                  placeholder="Ej: 77.889.2343-0"
                  v-model="rut"
                  name="rut"
                  v-rut:live
                  maxlength="12"
                  disabled
                />
                <span class="errors" v-if="errors && errors.rut">{{errors.rut[0] }}</span>
              </div>
              <div class="form-group col-md-6">
                <label for>Nombre</label>
            <input
                  type="text"
                  class="form-control form-control-sm"
                  placeholder="ingrese el nombre completo de la empresa"
                  v-model="name"
                  name="name"
                />
                <span class="errors" v-if="errors && errors.name">{{errors.name[0] }}</span>
              </div>
            </div>
            <div class="row">
              <div class="form-group col-md-6">
                <label for>Teléfono / celular</label>
            <input
                  type="text"
                  class="form-control form-control-sm"
                  placeholder="Ingrese un número de contacto de la empresa"
                  v-model="phone"
                  name="phone"
                  maxlength="9"
                  @keypress="isNumber($event)"
                />
                <span class="errors" v-if="errors && errors.phone">{{errors.phone[0] }}</span>
              </div>
              <div class="form-group col-md-6">
                <label for>Correo</label>
            <input
                  type="text"
                  class="form-control form-control-sm"
                  placeholder="Ingrese el correo de contacto de la empresa"
                  v-model="email"
                  name="email"
                />
                <span class="errors" v-if="errors && errors.email">{{errors.email[0] }}</span>
              </div>
            </div>
            <div class="row">
              <div class="form-group col-md-4">
                <label for>Región</label>
            <select
                  class="form-control form-control-sm"
                  v-model="region_id"
                  name="region_id"
                  @change="getCommunes()"
                >
                  <option value="0" selected>Seleccione una región</option>
                  <option
                    v-for="(list, index) in region_list"
                    :key="index"
                    :value="list.id"
                  >{{ list.name }}</option>
                </select>
                <span class="errors" v-if="errors && errors.region_id">{{errors.region_id[0] }}</span>
              </div>
              <div class="form-group col-md-4">
                <label for>Comuna</label>
            <select class="form-control form-control-sm" v-model="commune_id">
                  <option value="0" selected>Seleccione una comuna</option>
                  <option
                    v-for="(list, index) in commune_list"
                    :key="index"
                    :value="list.id"
                    name="commune_id"
                  >{{ list.name }}</option>
                </select>
                <span class="errors" v-if="errors && errors.commune_id">{{errors.commune_id[0] }}</span>
              </div>
              <div class="form-group col-md-4">
                <label for>Dirección</label>
            <input
                  type="text"
                  class="form-control form-control-sm"
                  placeholder="Ingrese la dirección del usuario"
                  v-model="address"
                  name="address"
                />
                <span class="errors" v-if="errors && errors.address">{{errors.address[0] }}</span>
              </div>
            </div>
            <div class="row"></div>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
  import Table from '../../mixins/Table.js'
  import Util  from '../../mixins/Util.js'
  export default {
    mixins: [Util, Table],
    data() {
      return {
        id: this.$route.params.id,
        csrf: document.querySelector('meta[name="csrf-token"]').getAttribute("content"),
        title        : "Editar empresa",
        sub_title    : "Formulario para la edición de una empresa del catálogo del sistema.",
        errors       : {},
        region_list  : {},
        commune_list : {},
        code_list    : {},
        rut          : "",
        name         : "",
        email        : "",
        phone        : "",
        address      : "",
        code_id      : "",
        commune_id   : "",
        region_id    : ""
      };
    },
    created() {
      this.getRegions();
      this.getListCode();
      this.getCatalogue();
    },
    methods: {
      getCatalogue() {
        var self = this;
        this.$http.get("/get-catalogue", { params: { id: self.id } }).then(
          response => {
            self.rut       = response.body.rut;
            self.name      = response.body.name;
            self.address   = response.body.address;
            self.phone     = response.body.phone_contact;
            self.email     = response.body.mail_contact;
            self.code_id   = response.body.code_id;
            self.region_id = response.body.commune.region.id;
            this.getCommunes();
            self.commune_id = response.body.commune_id;
          },
          response => {
            self.$toasted.global.APP_GENERAL_ERROR();
          }
        );
      },
      getListCode() {
        var self = this;
        this.$http.get("/code-list-select-box").then(
          function(response) {
            self.code_list = response.body;
          },
          function() {
            this.$toasted.global.APP_GENERAR_ERROR();
          }
        )
      },
      getRegions() {
        var self = this;
        this.$http.get("/region-list").then(
          function(response) {
            self.region_list = response.body;
          },
          function() {
            this.$toasted.global.APP_GENERAR_ERROR();
          }
        );
      },
      getCommunes() {
        this.commune_id = "";
        var self = this;
        this.$http
          .get("/commune-list", { params: { region: self.region_id } })
          .then(
            function(response) {
              self.commune_list = response.body;
            },
            function() {
              this.$toasted.global.APP_GENERAR_ERROR();
            }
          );
      },
      postRequestCreate() {
        event.preventDefault();
        var data = {
          _token     : this.csrf,
          id         : this.id,
          name       : this.name,
          rut        : this.rut,
          address    : this.address,
          phone      : this.phone,
          email      : this.email,
          code_id    : this.code_id,
          region_id  : this.region_id,
          commune_id : this.commune_id
        };
        var self = this;
        this.$http.post("/catalogue-update", data).then(
          response => {
            self.$toasted.global.APP_GENERAL_SUCCESS();
            self.errors = {};
            self.$router.push({ path: "/catalogue"})
          },
          response => {
            if (response.status === 422) {
              self.$toasted.global.APP_GENERAL_ERROR_FORM();
              self.errors = response.body.errors;
            }
          }
        );
      },
      isNumber: function(evt) {
        evt = evt ? evt : window.event
        var charCode = evt.which ? evt.which : evt.keyCode
        if (
          charCode > 31 &&
          (charCode < 48 || charCode > 57) &&
          charCode !== 46
        ) {
          evt.preventDefault()
        } else {
          return true
        }
      }
    },
    filters: {
      upper: function(value) {
        return value.toUpperCase()
      }
    }
  }
</script>
<style>
.simple-root {
  margin-top: 20%;
  margin-left: auto;
  margin-right: auto;
}
.help.is-danger {
  color: red;
}
.form-control.is-danger {
  border: 1px solid red;
}
.errors {
  color: red;
}
</style>
@endsection
