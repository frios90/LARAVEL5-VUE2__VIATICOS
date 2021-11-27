<template>
    <div class="content-wrapper">
        <div v-if="loader" class="loader"></div>
        <div class="row">
            <div class="col-md-12 grid-margin">
                <div class="d-flex justify-content-between flex-wrap">
                    <div class="align-items-end flex-wrap">
                        <view-navigation :list="'edit_request'"></view-navigation>
                        <div class="mr-md-3 mr-xl-5">
                            <h2>Editar Solicitud {{ folio }} </h2>
                            <p class="mb-md-0 p-description-module">Formulario para la edicion de una solicitud}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="grid-margin stretch-card">
            <div class="card">
                <p class="card-title">
                    <button class="btn-approve-item float-right mdi mdi-check" title="Guardar" @click="postRequestCreate"></button>
                    <router-link to="/request/user">
                        <button class="btn-back-item float-right mdi mdi-arrow-left" title="Volver">
                            <a href=""></a>
                        </button>
                    </router-link>
                </p>
                <div class="card-body">
                    <form class="forms-sample">
                        <div class="row">
                            <div class="form-group col-md-4">
                                <label for="">Monto efectivo a solicitar</label>
                                <span class="mdi mdi-alert-circle circle-info" title="Ingrese efectivo estimado"></span>
                                <input type="number" class="form-control form-control-sm" placeholder="Ingrese efectivo estimado" v-model="cash" name="cash">
                                <span class="errors" v-if="errors && errors.cash">{{errors.cash[0] }}</span>

                            </div>
                            <div class="form-group col-md-4">
                                <label for="">Fecha de inicio</label>
                                <span class="mdi mdi-alert-circle circle-info" title="Seleccione fecha de incio del evento"></span>
                                <input type="date" class="form-control form-control-sm" v-model="init" name="init">
                                <span class="errors" v-if="errors && errors.init">{{errors.init[0] }}</span>
                            </div>
                            <div class="form-group col-md-4">
                                <label for="">Fecha de fin</label>
                                <span class="mdi mdi-alert-circle circle-info" title="Seleccione fecha de fin del evento"></span>
                                <input type="date" class="form-control form-control-sm" v-model="end" name="end">
                                <span class="errors" v-if="errors && errors.end">{{errors.end[0] }}</span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-4">
                                <label for="">Región</label>
                                <span class="mdi mdi-alert-circle circle-info" title="Seleccione la region donde se realizará en elvento"></span>

                                <select class="form-control form-control-sm" v-model="region" name="region" @change="getCommunes()">
                                    <option value="0" selected>Seleccione una región</option>
                                    <option v-for="(list, index) in region_list" :key="index" :value="list.id">
                                        {{ list.name }}
                                    </option>
                                </select>
                                <span class="errors" v-if="errors && errors.region">{{errors.region[0] }}</span>
                            </div>
                            <div class="form-group col-md-4">
                                <label for="">Comuna</label>
                                <span class="mdi mdi-alert-circle circle-info" title="Seleccione la comuna donde se realizara el evento. *promero seleccione la región"></span>

                                <select class="form-control form-control-sm" v-model="commune" name="commune">
                                    <option value="0" selected>
                                        Seleccione una comuna
                                    </option>
                                    <option v-for="(list, index) in commune_list" :key="index" :value="list.id">
                                        {{ list.name }}
                                    </option>
                                </select>
                                <span class="errors" v-if="errors && errors.commune">{{errors.commune[0] }}</span>
                            </div>
                            <div class="form-group col-md-4">
                                <label for="">Destino</label>
                                <span class="mdi mdi-alert-circle circle-info" title="Ingrese lugar de destino"></span>
                                <input type="text" class="form-control form-control-sm" placeholder="Ingrese destino general del evento" v-model="destiny" name="destiny" />
                                <span class="errors" v-if="errors && errors.destiny">{{errors.destiny[0] }}</span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-12">
                                <label for="">Descripción del evento</label>
                                <span class="mdi mdi-alert-circle circle-info" title="Ingrese el detalle completo del evento a realizarce."></span>
                                <textarea v-model="description" class="form-control " rows="4" name="description">
                                </textarea>
                                <span class="errors" v-if="errors && errors.description">{{errors.description[0] }}</span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label for="">Staff</label>
                                <span class="mdi mdi-alert-circle circle-info" title="Agregue a cada uno de los travelers que participarán en el evento"></span>
                                <button class="float-right btn-add-row mdi mdi-plus" @click="addRowStaff"></button>
                                <div v-for="(row, index) in staff" :key="index">
                                    <div class="input-group">
                                        <select class="form-control form-control-sm" v-model="staff[index]" name="staff" @change="selectStaff()">
                                            <option value="0">Seleccione un Traveler</option>
                                            <template v-for="(list, index_staff) in staff_list">
                                                <option v-if="list.id == row.id" :key="index_staff" :value="row.id" selected='selected'>
                                                    {{ row.name }} - selleccionado
                                                </option>
                                                <option v-else :key="index_staff" :value="list.id">
                                                    {{ list.name }}
                                                </option>
                                            </template>
                                        </select>
                                        <button class="btn-delete-row mdi mdi-close-octagon" @click="deleteRowStaff(row)" :key="index"></button>
                                    </div>
                                    <span class="errors" v-if="errors && errors.staff">{{errors.staff[0] }}</span>
                                    <br>
                                </div>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="">Proyectos</label>
                                <span class="mdi mdi-alert-circle circle-info" title="Detalle los proyectos a los que estará relacionado el evento"></span>
                                <button class="float-right btn-add-row mdi mdi-plus" @click="addRowProject"></button>
                                <div v-for="(row, index) in projects" :key="index">
                                    <div class="input-group">
                                        <input type="text" class="form-control col-md-4 form-control-sm" placeholder="identificador" name="projects" v-model="projects[index].folio">
                                        <input type="text" class="form-control col-md-8 form-control-sm" placeholder="descripción" name="projects" v-model="projects[index].description">
                                        <button class="btn-delete-row mdi mdi-close-octagon" @click="deleteRowProject(row)"></button>
                                    </div>
                                    <span class="errors" v-if="errors && errors.projects">{{errors.projects[0] }}</span>
                                    <br>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
    import Util from '../mixins/Util.js'
    export default {      
        mixins: [ Util],
        data() {
            return {
                loader      : true,
                id          : this.$route.params.id,
                errors      : {},
                staff       : [{}],
                staff_list  : {},

                projects    : [{
                    folio       : "",
                    description : ""
                }],
                description : "",
                init        : "",
                end         : "",
                destiny     : "",
                cash        : "",                
                status      : "",
                folio       : ""
            }
        },
        created() {            
            this.getRegions()
            this.getListStaff()
            this.getRequest()
        },       
        methods: {
            addRowStaff() {
                event.preventDefault()                  
                if (this.staff_list.length > this.staff.length) {
                    this.staff.push({
                        id: ''
                    })
                }
            },
            addRowProject() {
                event.preventDefault()
                this.projects.push({
                    folio: "",
                    description: ""
                })
            },
            deleteRowStaff(row) {
                event.preventDefault()
                var index = this.staff.indexOf(row);
                if (index !== -1) {
                    this.staff.splice(index, 1);
                }
            },
            deleteRowProject(row) {
                event.preventDefault()
                var index = this.projects.indexOf(row);
                if (index !== -1) {
                    this.projects.splice(index, 1);
                }
            },
            selectStaff() {
                event.preventDefault()
            },
            getListStaff() {
                var self = this
                this.$http.get('/user-traveler-list').then(function(response) {
                    self.staff_list = response.body
                }, function() {
                    this.$toasted.global.APP_GENERAR_ERROR()
                })
            },
            getRequest() {
                var self = this
                this.$http.get('/get-request', {
                        params: {
                            id: self.id
                        }
                    })
                    .then(response => {
                        self.status      = response.body.request.code.label
                        self.description = response.body.request.description
                        self.init        = response.body.request.going_at
                        self.end         = response.body.request.return_at
                        self.destiny     = response.body.request.destiny
                        self.cash        = response.body.request.cash
                        self.folio        = response.body.request.folio
                        self.region      = response.body.request.commune.region.id
                        this.getCommunes()
                        self.commune     = response.body.request.commune_id
                        self.staff       = response.body.staff
                        self.projects    = response.body.request.projects
                        self.loader      = false
                    }, response => {
                        self.$toasted.global.APP_GENERAL_ERROR()

                    })

            },
            postRequestCreate() {
                event.preventDefault()
                var data = {
                    _token: this.csrf,
                    id: this.id,
                    staff: this.staff,
                    projects: this.projects,
                    description: this.description,
                    init: this.init,
                    end: this.end,
                    destiny: this.destiny,
                    cash: this.cash,
                    region: this.region,
                    commune: this.commune,
                    region: this.region
                }
                var self = this
                this.$http.post('/request-user-update', data)
                    .then(response => {
                        self.$toasted.global.APP_GENERAL_SUCCESS()
                        self.errors = {}
                        self.$router.push({
                            path: "/request/user"
                        })
                    }, response => {
                        if (response.status === 422) {
                            self.$toasted.global.APP_GENERAL_ERROR_FORM()
                            self.errors = response.body.errors
                        } else {
                            self.$toasted.global.APP_GENERAL_ERROR()
                        }
                    })
            }
        },
        filters: {
            upper: function(value) {
                return value.toUpperCase();
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
</style>
@endsection