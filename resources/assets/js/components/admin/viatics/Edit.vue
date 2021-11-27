<template>
    <div class="content-wrapper">
        <div v-if="loader" class="loader"></div>
        <div class="row">
            <div class="col-md-12 grid-margin">
                <div class="d-flex justify-content-between flex-wrap">
                    <div class="align-items-end flex-wrap">
                        <view-navigation :list="'viatics_edit'"></view-navigation>
                        <div class="mr-md-3 mr-xl-5">
                            <h2>{{ title }}</h2>
                            <p class="mb-md-0 p-description-module">{{ sub_title }}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="grid-margin stretch-card">
            <div class="card">
                <p class="card-title">
                    <button class="btn-approve-item float-right mdi mdi-check" title="Guardar" @click="postRequestCreate"></button>
                    <router-link to="/viatics">
                        <button class="btn-back-item float-right mdi mdi-arrow-left" title="Volver">
                            <a href=""></a>
                        </button>
                    </router-link>
                </p>
                <div class="card-body">
                    <form class="forms-sample">
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label for="">Tipo</label>
                                <select class="form-control form-control-sm" v-model="type_id" name="type_id">
                                    <option v-for="(list, index) in type_list" :key="index" :value="list.id">
                                        {{ list.label }}
                                    </option>
                                </select>
                                <span class="errors" v-if="errors && errors.type_id">{{errors.type_id[0] }}</span>
                            </div>  
                        </div>
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label for="">Nombre</label>
                                <input type="text" class="form-control form-control-sm" v-model="label" name="label">
                                <span class="errors" v-if="errors && errors.label">{{errors.label[0] }}</span>
                            </div>                           
                        </div>
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label for="">Código</label>
                                <input type="text" class="form-control form-control-sm" v-model="name" name="name">
                                <span class="errors" v-if="errors && errors.name">{{errors.name[0] }}</span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label for="">Descripción</label>
                                <input type="text" class="form-control form-control-sm" v-model="description" name="description">
                                <span class="errors" v-if="errors && errors.description">{{errors.description[0] }}</span>
                            </div>      
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
    import Util from '../../mixins/Util.js'
    export default {
        mixins: [Util],
        name: 'edit.viatic',
        data() {
            return {
                id           : this.$route.params.id,
                title        : "Editar viático ",
                sub_title    : "Formulario para la edición de registros para viáticos.",
                errors       : {},
                region_list  : {},
                commune_list : {},
                type_list    : {},
                type_id      : "",
                name         : "",
                label        : "",
                description  : ""
            }
        },
        created() {
            this.getListType()
            this.getViatic()
        },
        methods: {
            getViatic() {
                var self = this
                this.$http.get("/get-viatic", { params: { id: self.id } }).then(
                    response => {
                    self.type_id     = response.body.type_id
                    self.label       = response.body.label
                    self.name        = response.body.name
                    self.description = response.body.description 
                    self.loader      = false              
                    },
                    response => {
                    self.$toasted.global.APP_GENERAL_ERROR()
                    }
                )
            },
            getListType() {
                var self = this
                this.$http.get('/type-list-select-box').then(function(response) {
                    self.type_list = response.body
                }, function() {
                    this.$toasted.global.APP_GENERAR_ERROR()
                })
            },
            postRequestCreate() {
                this.loader = true
                event.preventDefault()
                var data = {
                    _token      : this.csrf,
                    id          : this.id,
                    type_id     : this.type_id,
                    name        : this.name,
                    label       : this.label,
                    description : this.description
                }
                var self = this
                this.$http.post('/viatic-update', data)
                    .then(response => {
                        self.$toasted.global.APP_GENERAL_SUCCESS()
                        self.errors = {}
                        self.$router.push({
                            path: "/viatics"
                        })
                    }, response => {
                        self.loader = false
                        if (response.status === 422) {
                            self.$toasted.global.APP_GENERAL_ERROR_FORM()
                            self.errors = response.body.errors
                        } else {
                            self.$toasted.global.APP_GENERAL_ERROR()
                        }
                    })
            } 
        }
    }
</script>
@endsection