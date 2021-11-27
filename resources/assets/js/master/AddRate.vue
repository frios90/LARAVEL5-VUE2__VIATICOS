<template>
  <div>
    <div class="card-body">  
      <div class="grid-margin stretch-card">           
      <div class="card manage-apply">
        <p class="card-title">
            <button class="btn-approve-item float-right mdi mdi-check" title="Gestionar" @click="management"></button>
            
          </p>
        
      </div>
    </div>                
      <div class="row">
        <div class="form-group col-md-4">
          <label for="" ><span class="span-title">Tipo</span></label>
            <select class="form-control form-control-sm" v-model="type_management_id" name="area_id" @change="changeTypeListManagement()" >
              <option  v-for="(list, index) in type_management_list" :key="index" :value="list.id">
                {{ list.label }}
              </option>
          </select>
        </div>
        <div  class="form-group col-md-4">
          <label for=""><span class="span-title">Subtipo</span></label>
          <select class="form-control form-control-sm" v-model="code_management_id" name="area_id" @change="changeCodeListManagement()">
            <option  v-for="(list, index) in code_management_list" :key="index" :value="list.id"> {{ list.label }} </option>
          </select>
        </div>
        <div class="form-group col-md-4">
          <label for=""><span class="span-title">Empresa</span></label>
            <select class="form-control form-control-sm" v-model="management_id" name="area_id" @change="changeListManagement()" >
            <option  v-for="(list, index) in management_list" :key="index" :value="list.id"> {{ list.name }} </option>
          </select>
        </div>
      </div>            
      <div class="row" v-show="management_id">
        <div class="form-group col-md-6">
          <label for=""><span class="span-title">Tarifas</span></label>
          <select class="form-control form-control-sm" v-model="rate_id" name="area_id" >
            <option  v-for="(list, index) in rate_list" :key="index" :value="list.id">
                    {{ list.description }}
            </option>
          </select>
        </div>
        <div class="form-group col-md-2">
          <label for=""><span class="span-title">Valor</span></label>
            <select class="form-control form-control-sm" v-model="rate_id" name="area_id" disabled>
            <option  v-for="(list, index) in rate_list" :key="index" :value="list.id">
                    {{ list.value }}
            </option>
          </select>
        </div>
        <div class="form-group col-md-1">
          <label for="" title="Si la cantidad es scero se asumira el total del staf"><span class="span-title">Cantidad</span></label>
          <input type="text" class="form-control form-control-sm" v-model="qty" name="address">
        </div>
        <div class="form-group col-md-2">
          <label for="" title=""><span class="span-title">Total</span></label>
          <input type="text" class="form-control form-control-sm" v-model="tariff_total" name="tariff_total" disabled>
        </div>
        <div v-show="rate_id" class="form-group col-md-1">
          <label for="" title=""></label><br/>
          <button class="btn-approve-item mdi mdi-plus" style="padding: 0px!important;margin: 0px!important;" @click="addTariffToList()"></button>
        </div>
      </div>
      <div v-show="tariff_list_manage.length > 0" class="row">
        <div class="form-group col-md-12">
          <label for=""><span class="span-title">Listado de Tarifas Ingresadas</span></label>
          <table class="table table-sm">
            <tbody>
              <tr>                       
                <td colspan="5"><span class="span-title" style="float:right!important;">Total Gestión</span></td>
                <td style="font-size:19px!important">{{calculateTotalManage  | currency }}</td>
                <td></td>
              </tr>
              <tr v-for="(list, index) in tariff_list_manage" :key="index">
                <td>{{ list.type             }}</td>
                <td>{{ list.code             }}</td>
                <td>{{ list.management       }}</td>
                <td>{{ list.rate             }}</td>
                <td>{{ list.qty              }}</td>
                <td>{{ list.value | currency }}</td>
                <td style="padding: 0px!important;"><button style="padding: 0px!important;margin: 0px!important;" class="btn-reject-item mdi mdi-minus" @click="deleteTariffToList(list)"></button></td>
              </tr>
            </tbody>
          </table>
        </div>                
      </div>
    </div> 
  </div>
</template>
<script>
import Util from '../components/mixins/Util.js'
import {mapState, mapMutations, mapActions} from "vuex"

export default {
  mixins: [Util],
  props: { 
    id_request : Number 
  },
  data () {
    return {
        qty          : 0,
        staff_list   : {},  
        type_management_list : {},
        type_management_id :"",
        code_management_list   : {},
        code_management_id :"",
        management_list   : {},
        management_id :"",
        rate_list   : [],
        rate_id :"",               
        tariff_list_manage: [],
        rates: [],
        folio: "",
        created_at: "",
        updated_at: "",
        user: "",
        total_manage: 0,
        tariff_total: 0
    }
  },
  created() {         
    this.getRequest(this.id_request)  
  },
  mounted(){
    this.loader      = false

  },
  methods: {   
    ...mapMutations(['setRequest']),
    ...mapActions(['getRequest']),
    getRequest () {
          var self = this
          this.$http.get('/get-request', {params: {id: self.id}})
          .then(response => {  
              self.request = response.body.request
              self.rates       = response.body.request.rates
              self.rates.forEach(function(rate){
                  self.tariff_list_manage.push({
                  rate_id    : rate.id,
                  qty        : rate.pivot.qty,
                  value      : rate.pivot.value,
                  type       : rate.management.code.type.label,
                  code       : rate.management.code.label,
                  management : rate.management.name,
                  rate       : rate.description
                })
              })
          }, response => {                 
              self.$toasted.global.APP_GENERAL_ERROR()
          })
    },
    getListMangenent () {
      var self = this  
      this.$http.get('/list-types-management').then(function(response){
          self.type_management_list = response.body
          }, function(){
              this.$toasted.global.APP_GENERAR_ERROR()
          }) 
    },
    changeTypeListManagement () {           
      var self = this  
      this.$http.get('/list-codes-management' , {params: {type: self.type_management_id}}).then(function(response){
          self.code_management_list = response.body
          }, function(){
              this.$toasted.global.APP_GENERAR_ERROR()
          }) 
    },
    changeCodeListManagement () {           
      var self = this  
      this.$http.get('/list-management' , {params: {code: self.code_management_id}}).then(function(response){
          self.management_list = response.body
          }, function(){
              this.$toasted.global.APP_GENERAR_ERROR()
          }) 
    },
    changeListManagement () {
      var self = this  
      this.$http.get('/list-rate-management' , {params: {management: self.management_id}}).then(function(response){
          self.rate_list = response.body
          }, function(){
              this.$toasted.global.APP_GENERAR_ERROR()
          }) 
    },          
    changeTariffValues () {            
        var self = this 
        this.rate_list.forEach(function(row){
          if (row.id == self.rate_id) {
            self.tariff_total = row.value * self.qty    
            }
          });
                  
    },
    addTariffToList () {
      var type = this.searchNameToList(this.type_management_list, this.type_management_id, 'label')
      var code = this.searchNameToList(this.code_management_list, this.code_management_id, 'label')
      var management = this.searchNameToList(this.management_list, this.management_id, 'name')
      var rate = this.searchNameToList(this.rate_list, this.rate_id, 'description')
      this.tariff_list_manage.push({
          rate_id: this.rate_id,
          qty: this.qty,
          value: this.tariff_total,
          type: type,
          code: code,
          management: management,
          rate: rate
        })
        console.log(this.tariff_list_manage)
    },
    searchNameToList (list, id, value) {
        var name = ""
        list.forEach(function(row){
        if (row.id == id) {
            if (value == 'description') {
              name = row.description
            }else if (value == 'label') {
              name = row.label
            } else {
              name = row.name
            }
          }
        })
        return name
    },
    deleteTariffToList(row) {
      event.preventDefault()
      var index = this.tariff_list_manage.indexOf( row );
      if ( index !== -1 ) {
        this.tariff_list_manage.splice( index, 1 );
      }
    },
    management () {
      this.$swal({
          input: 'text',
          inputAttributes: {
              autocapitalize: 'off',
              placeholder: "Ingrese una Observación para el evento"
          },
          showCancelButton: true,
          confirmButtonText: 'Gestionar',
          cancelButtonText: 'Cancelar',
          showLoaderOnConfirm: true,
          preConfirm: (comment) => {                    
            var data = {
              _token  : this.csrf,
              id: this.id_request,
              detail: this.tariff_list_manage
            }
            console.log(data)
            var self = this  
            this.$http.post('/management-store', data)
            .then(response => {
                self.$toasted.global.APP_GENERAL_SUCCESS()
                self.errors = {}
                window.location.href = window.location.origin + "/request/manage"
            }, response => {                 
                if (response.status === 422) {
                  self.$toasted.global.APP_GENERAL_ERROR_FORM()
                  self.errors = response.body.errors
                }else{
                  self.$toasted.global.APP_GENERAL_ERROR()
                }
            }) 
          }
      })
    }
  },
  
        
        computed: {
           ...mapState(['request']),
          calculateTotalManage () {
            this.total_manage = 0
            var self = this
            this.tariff_list_manage.forEach(function(val, index){
              console.log(val.value)
              self.total_manage = parseInt(self.total_manage) + parseInt(val.value)
            })
            return this.total_manage
          }
        },
        watch: {
          qty () {
            this.changeTariffValues()
          },
          rate_id () {
            this.changeTariffValues()
          }
        }
}
</script>

<style>
</style>