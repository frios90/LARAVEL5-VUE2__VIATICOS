<template>
    <div class="content-wrapper">
        <div v-if="loader" class="loader"></div>
        <div class="row">
            <div class="col-md-12 grid-margin">
                <div class="d-flex justify-content-between flex-wrap">
                    <div class="d-flex align-items-end flex-wrap">
                        <div class="mr-md-3 mr-xl-5">
                            <h2>Nuevo Tipo</h2>
                            <p class="mb-md-0">{{ sub_title }}</p>
                        </div>
                        <view-navigation :list="'types_create'"></view-navigation>
                    </div>
                </div>
            </div>
        </div>
        <div class="grid-margin stretch-card">
            <div class="card">
                <p class="card-title">
                    <button class="btn-approve-item float-right mdi mdi-check" title="Guardar" @click="postRequestCreate"></button>
                    <router-link to="/types">
                        <button class="btn-back-item float-right mdi mdi-arrow-left" title="Volver">
                            <a href=""></a>
                        </button>
                    </router-link>
                </p>
                <div class="card-body">
                    <form class="forms-sample">                        
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
    export default {
        name: 'create',
        data() {
            return {
                csrf: document.querySelector('meta[name="csrf-token"]').getAttribute('content'),              
                errors       : {},
                region_list  : {},
                commune_list : {},
                name         : "",
                label        : "",
                description  : ""
            }
        },
        created() {
            this.getListType()
        },
        methods: {
            getListType() {
                    var self = this
                    this.$http.get('/type-list-select-box').then(function(response) {
                        self.type_list = response.body
                    }, function() {
                        this.$toasted.global.APP_GENERAR_ERROR()
                    })
                },
                postRequestCreate() {
                    event.preventDefault()
                    var data = {
                        _token      : this.csrf,
                        name        : this.name,
                        label       : this.label,
                        description : this.description
                    }
                    var self = this
                    this.$http.post('/type-store', data)
                        .then(response => {
                            self.$toasted.global.APP_GENERAL_SUCCESS()
                            self.errors = {}
                            self.$router.push({
                                path: "/types"
                            })
                        }, response => {
                            if (response.status === 422) {
                                self.$toasted.global.APP_GENERAL_ERROR_FORM()
                                self.errors = response.body.errors
                            } else {
                                self.$toasted.global.APP_GENERAL_ERROR()
                            }
                        })
                },
                isNumber: function(evt) {
                    evt          = (evt) ? evt : window.event;
                    var charCode = (evt.which) ? evt.which : evt.keyCode;
                    if ((charCode > 31 && (charCode < 48 || charCode > 57)) && charCode !== 46) {
                        evt.preventDefault();;
                    } else {
                        return true;
                    }
                }
        },
        filters: {
            upper: function(value) {
                return value.toUpperCase();
            }
        }
    }
</script>
@endsection