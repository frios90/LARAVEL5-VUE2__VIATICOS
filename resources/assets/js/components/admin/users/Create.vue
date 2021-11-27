<template >
    <div class="content-wrapper">
      <div v-if="loader" class="loader"></div>
      <div class="row">
        <div class="col-md-12 grid-margin">
          <div class="d-flex justify-content-between flex-wrap">
            <div class="align-items-end flex-wrap">
              <view-navigation :list="'users_create'"></view-navigation>

              <div class="mr-md-3 mr-xl-5">
                <h2>Nuevo Usuario</h2>
                <p class="mb-md-0 p-description-module">Formulario para el ingreso de un <b>Nuevo Registro</b> para <b>Usuarios</b></p>
              </div>                  
            </div>                
          </div>
        </div>
      </div>        
      <div class="grid-margin stretch-card">           
        <div class="card">
          <p class="card-title">
            <button class="btn-approve-item float-right mdi mdi-check" title="Guardar el nuevo Usuario" @click="postRequestCreate"></button>
            <router-link to="/users">
              <button class="btn-back-item float-right mdi mdi-arrow-left" title="Volver al menu anterior" ><a href=""></a></button>
            </router-link> 
          </p>
          <div class="card-body">            
            <form class="forms-sample">       
              <div class="row">                
                <div class="form-group col-md-4">
                  <label for="">Rut</label>
                  <span class="mdi mdi-alert-circle circle-info" title="Ingrese el Rut del nuevo Usuario"></span>
                    <input  type="text" 
                          class="form-control form-control-sm"
                          v-model="rut" 
                          name="rut" 
                          v-rut:live 
                          maxlength="12"
                    >  
                  <span class="errors" v-if="errors && errors.rut">{{errors.rut[0] }}</span>               
                </div>
                <div class="form-group col-md-8">
                  <label for="">Nombre</label>
                  <span class="mdi mdi-alert-circle circle-info" title="ingrese el Nombre Completo del nuevo Usuario"></span>
                  <input  type="text" 
                          class="form-control form-control-sm" 
                          v-model="name"
                          name="name"                          
                  >
                  <span class="errors" v-if="errors && errors.name">{{errors.name[0] }}</span>               
                </div>
              </div>
              <div class="row">                
                <div class="form-group col-md-6">
                  <label for="">Teléfono / Celular</label>
                  <span class="mdi mdi-alert-circle circle-info" title="Ingrese el número de Teléfono o Celular del Usuario"></span>
                  <input  type="text" 
                          class="form-control form-control-sm"
                          v-model="phone"
                          name="phone"
                          maxlength="9"
                          @keypress="isNumber($event)"
                  >
                  <span class="errors" v-if="errors && errors.phone">{{errors.phone[0] }}</span>               
                </div>
                <div class="form-group col-md-6">
                  <label for="">Correo / Acceso</label>
                  <span class="mdi mdi-alert-circle circle-info" title="Ingrese el Correo de contato del usuario. Este correo será con el cual el Usuario ingresará a la plataforma"></span>
                  <input  type="text"
                          class="form-control form-control-sm" 
                          placeholder="Ingrese el correo de contacto y acceso del usuario" 
                          v-model="email"
                          name="email"
                  >       
                  <span class="errors" v-if="errors && errors.email">{{errors.email[0] }}</span>               
                </div>
              </div>
              <div class="row">
                <div class="form-group col-md-4">
                  <label for="">Región</label>
                  <span class="mdi mdi-alert-circle circle-info" title="Seleccione la Región de residencia del nuevo Usuario"></span>
                  <select class="form-control form-control-sm" 
                          v-model="region_id"
                          name="region_id"
                          @change="getCommunes()"
                          >
                    <option value="0" selected>Seleccione una región</option>
                    <option  v-for="(list, index) in region_list" 
                            :key="index" 
                            :value="list.id">
                            {{ list.name }}
                    </option>
                  </select>
                  <span class="errors" v-if="errors && errors.region_id">{{errors.region_id[0] }}</span>               
                </div>
                <div class="form-group col-md-4">
                  <label for="">Comuna</label>
                  <span class="mdi mdi-alert-circle circle-info" title="Seleccione la Comuna de residencia del nuevo Usuario. Para ver listado primero seleccione una Región"></span>
                  <select class="form-control form-control-sm" v-model="commune_id">
                    <option value="0" selected>Seleccione una comuna</option>
                    <option v-for="(list, index) in commune_list" 
                            :key="index" 
                            :value="list.id"
                            name="commune_id"
                            >                            
                            {{ list.name }}</option>
                  </select>
                  <span class="errors" v-if="errors && errors.commune_id">{{errors.commune_id[0] }}</span>               
                 
                </div>
                <div class="form-group col-md-4">
                  <label for="">Dirección</label>
                  <span class="mdi mdi-alert-circle circle-info" title="ingrese la Dirección especifica del nuevo Usuario"></span>

                  <input type="text" 
                          class="form-control form-control-sm" 
                          v-model="address"
                          name="address">
                  <span class="errors" v-if="errors && errors.address">{{errors.address[0] }}</span>               
              </div>                
              </div> 
              <div class="row">
                <div class="form-group col-md-4">
                  <label for="">Área</label>
                  <span class="mdi mdi-alert-circle circle-info" title="Seleccione el departamento en el cual el nuevo Usuario se desempeñará"></span>
                  <select class="form-control form-control-sm"
                          v-model="area_id"
                          name="area_id" >
                    <option  v-for="(list, index) in area_list"                             
                            :key="index" 
                            :value="list.id">
                            {{ list.name }}
                    </option>
                  </select>
                  <span class="errors" v-if="errors && errors.area_id">{{errors.area_id[0] }}</span>               
                </div>
                <div class="form-group col-md-4">
                  <label for="">Perfil</label>
                  <span class="mdi mdi-alert-circle circle-info" title="Seleccione el perfil a utilizar por el nuevo Usuario en la aplicación"></span>
                  <select class="form-control form-control-sm"
                          v-model="profile_id"
                          name="profile_id">
                    <option  v-for="(list, index) in profile_list"                             
                            :key="index" 
                            :value="list.id">
                            {{ list.label }}
                    </option>
                  </select>
                  <span class="errors" v-if="errors && errors.profile_id">{{errors.profile_id[0] }}</span>               
                </div>    
              </div>                             
            </form>
          </div>
        </div>
      </div>    
    </div>   
</template>
<script>
    export default {
        name: 'create',
        data () {
            return {
                csrf: document.querySelector('meta[name="csrf-token"]').getAttribute('content'),             
                errors       : {},
                region_list  : {},
                commune_list : {},
                area_list    : {},
                profile_list : {},                
                rut          : "",
                name         : "",
                email        : "",
                cash         : "",
                phone        : "",
                address      : "",
                area_id      : "",
                profile_id   : "",
                commune_id   : "",
                region_id    : ""
            }
        },       
        created() {
          this.getRegions()
          this.getListArea()
          this.getListProfile()
        },
        methods: { 
          getListArea () {
            var self = this  
            this.$http.get('/area-list-select-box').then(function(response){
                self.area_list = response.body
                }, function(){
                    this.$toasted.global.APP_GENERAR_ERROR()
                })
          },
          getListProfile () {
            var self = this  
            this.$http.get('/profile-list-select-box').then(function(response){
                self.profile_list = response.body
                }, function(){
                    this.$toasted.global.APP_GENERAR_ERROR()
                })   
          },
          getRegions ()  {
            var self = this  
            this.$http.get('/region-list').then(function(response){
                self.region_list = response.body
                }, function(){
                     this.$toasted.global.APP_GENERAR_ERROR()
                })           
          },
          getCommunes ()  {
              this.commune_id = ''
              var self = this  
                this.$http.get('/commune-list', {params: {region: self.region_id}}).then(function(response){
                    self.commune_list = response.body
                    }, function(){
                         this.$toasted.global.APP_GENERAR_ERROR()
                    })           
          },
          postRequestCreate () {
            event.preventDefault()
            var data = {
                _token     : this.csrf,
                rut        : this.rut,
                name       : this.name,
                address    : this.address,
                phone      : this.phone,
                email      : this.email,
                area_id    : this.area_id,
                profile_id : this.profile_id,
                region_id  : this.commune_id, 
                commune_id : this.commune_id               
            }
            var self = this  
            this.$http.post('/user-store', data)
            .then(response => {
                self.$toasted.global.APP_GENERAL_SUCCESS()
                self.errors = {}
                self.$router.push({ path: "/users"})
              }, response => {                 
                 if (response.status === 422) {
                    self.$toasted.global.APP_GENERAL_ERROR_FORM()
                    self.errors = response.body.errors
                 }else{
                   self.$toasted.global.APP_GENERAL_ERROR()
                 }
              })
           },
           isNumber: function(evt) {
              evt = (evt) ? evt : window.event;
              var charCode = (evt.which) ? evt.which : evt.keyCode;
              if ((charCode > 31 && (charCode < 48 || charCode > 57)) && charCode !== 46) {
                evt.preventDefault();;
              } else {
                return true;
              }
            }
        },
        filters: {
          upper: function (value) {
              return value.toUpperCase();
          }
        }
    }
</script>
@endsection
