<template >
  <div class="content-wrapper">
    <div v-if="loader" class="loader"></div>
    <div class="row">
      <div class="col-md-12 grid-margin">
        <div class="d-flex justify-content-between flex-wrap">
          <div class="align-items-end flex-wrap">
            <view-navigation :list="'accredit_request'"></view-navigation>
            <div class="mr-md-3 mr-xl-5">
              <h2>Acreditar Solicitud [ {{ request.folio }} ]</h2>
              <p class="mb-md-0 p-description-module">
                Formulario para la
                <b>Acreditación</b> de Solicitudes.
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="grid-margin stretch-card">
      <div class="card">
        <p class="card-title">
          <button class="btn-approve-item float-right mdi mdi-camera" title="Añadir documento" @click="showAccreditation()"></button>
          <button class="btn-approve-item float-right mdi mdi-check" title="Guardar cambios" @click="postAccredit" ></button>
          <router-link to="/request/user">
            <button class="btn-back-item float-right mdi mdi-arrow-left" title="Volver al menu anterior" >
              <a href></a>
            </button>
          </router-link>
        </p>
        <div class="card-body">
          <div class="col-md-12">
            <view-head-detail-request :id_request="id"></view-head-detail-request>  
          </div>
          <br>
          <span class="span-title">Ingrese documentos que acrediten los gastos realizados</span>
          <br>
          <form class="forms-sample">
            <div class="row">
              <div class="form-group col-md-6">
                <label for>Número</label>
                <span class="mdi mdi-alert-circle circle-info" title="Ingrese la Descripción de la Tarifa a crear" ></span>
                <input type="text" class="form-control form-control-sm" v-model="data.number" name="number" />
                <span class="errors" v-if="errors && errors.number">{{errors.number[0] }}</span>
              </div>
              <div class="form-group col-md-6">
                <label for>Fecha de Emisión</label>
                <span class="mdi mdi-alert-circle circle-info" title="Ingrese la Descripción de la Tarifa a crear" ></span>
                <input type="date" class="form-control form-control-sm" v-model="data.emited_at" name="emited_at" />
                <span class="errors" v-if="errors && errors.emited_at">{{errors.emited_at[0] }}</span>
              </div>
            </div>
            <div class="row">
              <div class="form-group col-md-6">
                <label for>Empresa</label>
                <span class="mdi mdi-alert-circle circle-info" title="Ingrese el Valor Unitario para esta Tarifa." ></span>
                <input type="text" class="form-control form-control-sm" v-model="data.name_company" name="name_company" />
                <span class="errors" v-if="errors && errors.name_company" >{{errors.name_company[0] }}</span>
              </div>
              <div class="form-group col-md-6">
                <label for>Rut</label>
                <span class="mdi mdi-alert-circle circle-info" title="Ingrese el Valor Unitario para esta Tarifa." ></span>
                <input type="text" class="form-control form-control-sm" v-rut:live maxlength="12" v-model="data.rut_company" name="rut_company" />
                <span class="errors" v-if="errors && errors.rut_company">{{errors.rut_company[0] }}</span>
              </div>
            </div>
            <div class="row">
              <div class="form-group col-md-6">
                <label for>Descripción</label>
                <span
                  class="mdi mdi-alert-circle circle-info"
                  title="Ingrese el Valor Unitario para esta Tarifa."
                ></span>
                <input type="text" class="form-control form-control-sm" v-model="data.description" name="description" />
                <span class="errors" v-if="errors && errors.description">{{errors.description[0] }}</span>
              </div>
              <div class="form-group col-md-6">
                <label for>Monto</label>
                <span class="mdi mdi-alert-circle circle-info" title="Ingrese el Valor Unitario para esta Tarifa." ></span>
                <input
                  type="text" class="form-control form-control-sm" v-model="data.amount" name="amount" />
                <span class="errors" v-if="errors && errors.amount">{{errors.amount[0] }}</span>
              </div>
            </div>
          </form>
          <div style="float: right;">
            <table>
              <tbody>
                <tr>
                  <td class="td-cash"><span class="span-total-manage-title">Total Gestión:</span></td>
                  <td class="td-cash td-cash-total"><span class="span-total-manage-value">{{ total_manage | currency  }}</span></td>
                </tr>
                <tr>
                  <td class="td-cash"><span class="span-total-manage-title">Total Efectivo:</span></td>
                  <td class="td-cash td-cash-total"><span class="span-total-manage-value"><span>{{  total_cash | currency }}</span></span></td>
                </tr>
                <tr>
                  <td class="td-cash"><span class="span-total-cash-title">Total Acreditado:</span></td>
                  <td class="td-cash td-cash-total"><span class="span-total-cash-value"><span>{{  total_accredit | currency }}</span></span></td>
                </tr>
                <tr>
                  <td class="td-cash"><span class="span-total-cash-title">Diferencia:</span></td>
                  <td class="td-cash td-cash-total"><span class="span-total-cash-value"><span :class="class_cash">{{  rest_cash | currency }}</span></span></td>
                </tr>
              </tbody>
            </table>
          </div>          
          <table class="table table-sm table-bordered">
            <thead>
              <tr class>
                <th class>Número</th>
                <th class>Fecha</th>
                <th class>Empresa</th>
                <th class>Rut</th>
                <th class>Descripción</th>
                <th class>Monto</th>
                <th class></th>
              </tr>
            </thead>
            <tbody class>
              <tr class v-for="(row, index) in documents" :key="index">
                <td class="td-acreditation" style="text-align: center">{{ row.number }}</td>
                <td class="td-acreditation" style="text-align: center">{{ row.emited_at }}</td>
                <td class="td-acreditation" style="text-align: center">{{ row.name_company }}</td>
                <td class="td-acreditation" style="text-align: center">{{ row.rut_company }}</td>
                <td class="td-acreditation" style="text-align: justify">{{ row.description }}</td>
                <td class="td-acreditation" style="text-align: right">{{ row.amount | currency}}</td>
                <td class>                  
                  <i class="mdi mdi-checkbox-blank-circle hover-cursor" @click="deleteRowAccredit(row.id)" ></i>
                </td>
              </tr>
            </tbody>
          </table>          
        </div>
      </div>
    </div>
    <modal name="list" class="modal-upload-pctures">
      <div class="modal-body">
        <div class="modal-content">         
          <form enctype="multipart/form-data">
            <div class="input-group">
              <div class="custom-file">
                <input type="file" name="filename" id="inputFileUpload" v-on:change="onFileChange" />
              </div>
              <div class="input-group-append">
                <button class="btn-approve-item float-right mdi mdi-check" @click="submitFile"></button>
              </div>
            </div>            
          </form>
          <br> 
          <span v-if="error_picture" class="errors">{{ error_picture }}</span>
           <div v-for="(file, key) in request_files" :key="key" class="grid-picture">
             <div class="grid-picture-div1">
                <viewer :options="viewer_options" :images="[file.path]">
                  <img v-for="src in [file.path]" :src="src" :key="src" width="100" height="80" />
                </viewer>
             </div>
             <div class="grid-picture-div2">
                <span class="span-key">Archivo:  </span> <span class="span-value"> {{ file.name }}          </span> <br>
                <span class="span-key">Original: </span> <span class="span-value"> {{ file.original_name }} </span> <br>
                <span class="span-key">Tamaño:   </span> <span class="span-value"> {{ file.size }}          </span> <br> 
             </div>
             <div class="grid-picture-div3">                
                <span class="span-key">Usuario:</span>  <span class="span-value">{{ file.user.name | upper }} </span> <br>
                <span class="span-key">Fecha:</span>  <span class="span-value">{{ file.created_at | dateTimeInverted }} </span> <br>
                <button class="btn-reject-item float-right mdi mdi-close-octagon" title="Eliminar" @click="deletePicture(file.id)"></button>
             </div> 
          </div>
        </div>
      </div>
    </modal>
  </div>
</template>
<script>
  import Util from "../mixins/Util.js"
  import axios from "axios"
  export default {
    mixins: [Util], 
    data() {
      return {
        id     : this.$route.params.id,
        errors : {},
        data: [
          {
            number       : "",
            emited_at    : "",
            name_company : "",
            rut_company  : "",
            description  : "",
            amount       : ""
          }
        ],
        request        : {},
        documents      : {},
        filename       : "",
        file           : "",
        success        : "",
        request_files  : {},
        images         : [],
        error_picture  : "",
        viewer_options : {
                          toolbar: false
                        },
        folio          : "",     
        total_manage   : 0,
        total_cash     : 0,
        total_accredit : 0,
        class_cash     : '',
        rest_cash      : 0,
        result_pop_up  : ''
      }
    },
    created() {
      this.getRequest()
    },
    methods: { 
    
      deletePicture (picture) {
        var data = {
          _token: this.csrf,
          picture_id: picture
        }
        var self = this
        this.$http.post("/delete-picture", data).then(
          response => {
            if (response.body.error) {
              this.error_picture = response.error
            }
            self.getFiles()
          },
          response => {
            if (response.status === 422) {
              self.$toasted.global.APP_GENERAL_ERROR_FORM()
              self.errors = response.body.errors
            } else {
              self.$toasted.global.APP_GENERAL_ERROR()
            }
          }
        )
      },
      getFiles() {
        var self = this
        this.$http
          .get("/request-files", {
            params: {
              request_id: self.id
            }
          })
          .then(
            response => {
              self.request_files = response.body.files
              self.images = response.body.array_files
            },
            response => {
              self.$toasted.global.APP_GENERAL_ERROR()
            }
          )
      },
      onFileChange(e) {
        this.filename = "Archivo seleccionado: " + e.target.files[0].name
        this.file = e.target.files
      },
      submitFile(e) {
        e.preventDefault()
        let currentObj = this
        let formData = new FormData()
        formData.append("file", this.file[0])
        formData.append("request_id", this.id)
        formData.append("_token", this.csrf)
        var self = this
        axios
          .post("/store-file", formData)
          .then(function(response) {
            if (response.data.error) {
              self.error_picture = response.data.error
            }
            currentObj.success = response.data.success
            currentObj.filename = ""
            self.getFiles()
          })
          .catch(function(error) {
            currentObj.output = error
          })
      },
      showAccreditation(value) {
        this.getFiles()
        this.$modal.show("list")
      },
      hideAccreditation() {
        this.$modal.hide("list")
      },
      getRequest() {
        var self = this
        this.$http
          .get("/get-request", {
            params: {
              id: self.id
            }
          })
          .then(
            response => {
              self.request      = response.body.request
              self.total_manage = response.body.total_request
              self.total_cash   = response.body.request.cash
              self.rest_cash    = response.body.request.cash
              self.loader       = false
              self.documents    = response.body.request.request_payment
              self.calculateTotalAccredit()
            },
            response => {
              self.$toasted.global.APP_GENERAL_ERROR()
            }
          )
      },
      postAccredit() {
        var data = {
          _token       : this.csrf,
          request_id   : this.id,
          number       : this.data.number,
          emited_at    : this.data.emited_at,
          name_company : this.data.name_company,
          rut_company  : this.data.rut_company,
          description  : this.data.description,
          amount       : this.data.amount,
          id_to_edit   : this.id_to_edit,
        }
        var self = this
        this.$http.post("/request-user-payment", data).then(
          response => {       
            self.$toasted.global.APP_GENERAL_SUCCESS()
            self.errors            = {}
            self.documents         = response.body
            self.calculateTotalAccredit()
            self.data.number       = ""
            self.data.emited_at    = ""
            self.data.name_company = ""
            self.data.rut_company  = ""
            self.data.description   = ""
            self.data.amount       = ""
          },
          response => {
            if (response.status === 422) {
              self.$toasted.global.APP_GENERAL_ERROR_FORM();
              self.errors = response.body.errors;
            } else {
              self.$toasted.global.APP_GENERAL_ERROR();
            }
          }
        )
      },
      deleteRowAccredit(row_id) {
        event.preventDefault();
        var data = {
          _token : this.csrf,
          id     : row_id,
        }
        var self = this;
        this.$http.post("/payment-delete-row", data).then(
          response => {
            self.getRequest()
            self.calculateTotalAccredit()
            self.$toasted.global.APP_GENERAL_SUCCESS()
          },
          response => {
            self.$toasted.global.APP_GENERAL_ERROR()
          }
        );
      },
      calculateTotalAccredit () {
        var self            = this
        self.total_accredit = 0
        this.documents.forEach(function(val, index){
          self.total_accredit = self.total_accredit + val.amount      
          self.rest_cash      = self.total_cash -  self.total_accredit
        })        
        if (this.rest_cash > 0) {
          this.class_cash = 'cash-negative'
        } else {
          this.class_cash = 'cash-positive'
        }
        this.rest_cash = this.rest_cash * -1
      }
    }
  }
</script>
<style>
  .td-cash-total{
    text-align: right;
    
  }
  .td-cash {
    padding: 2px 15px!important;   
  }
  .cash-negative {
    color: red;
  }
  .cash-positive {
    color: green;
  }
  .span-total-manage-title {
    font-weight: bold;
    font-size: 10px;
  }
  .span-total-cash-title {
    font-weight: bold;
    font-size: 14px;
  }
  .span-total-manage-value {    
    font-size: 10px;
  }
  .span-total-cash-value {    
    font-size: 14px;
  }
  .modal-content {
    padding:15px!important;
  }
  .modal-upload-pctures {
      overflow: scroll;  
  }
  .grid-picture {
    display: grid;
    grid-template-columns: 0.5fr repeat(2, 1fr);
    grid-template-rows: 1fr;
    grid-column-gap: 0px;
    grid-row-gap: 0px;
    margin-bottom: 5px;
  }
  .grid-picture-div1 { grid-area: 1 / 1 / 2 / 2; }
  .grid-picture-div2 { grid-area: 1 / 2 / 2 / 3; }
  .grid-picture-div3 { grid-area: 1 / 3 / 2 / 4; } 
  .span-key {
    font-weight: bold;
    font-size: 10px;
  }
  .span-value {
    font-size: 12px;
  }
/* ESTILO DEL DIV QUE CONTENTRÁ EL INPUT */
  .upload-btn-wrapper {
    position: relative;
    overflow: hidden;
    display: inline-block;
  }
/* ESTILO DEL INPUT*/
  .upload-btn-wrapper input[type=file] {
    font-size: 100px;
    position: absolute;
    left: 0;
    top: 0;
    opacity: 0;
  }
/* ESTILO DEL BOTÓN */
  .boton-standar-rw{
    margin: 5px;
    background-color: white;
    color: rgb(245, 61, 58);
    border-radius: 20px;
    font-weight: bold;
    letter-spacing: 1px;
    line-height: 15px;
    border: 2px solid rgb(245, 61, 58);
    transition: all 0.3s ease 0s;
    width: 12em;
    padding: 10px;
  }
/* ESTILO DEL BOTÓN CON HOVER DE MOUSE */
  .boton-standar-rw:hover{
    color: white;
    background-color: rgb(245, 61, 58);
  }
</style>
@endsection
