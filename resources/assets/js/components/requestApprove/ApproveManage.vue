<template>
    <div class="content-wrapper">
        <div v-if="loader" class="loader"></div>
        <div class="row">
            <div class="col-md-12 grid-margin">
                <div class="d-flex justify-content-between flex-wrap">
                    <div class="align-items-end flex-wrap">
                        <view-navigation :list="'request_approve_manage'"></view-navigation>

                        <div class="mr-md-3 mr-xl-5">
                            <h2>Gestión de Solicitud por Aprobar  [{{ request.folio }}]</h2>
                            <p class="mb-md-0  p-description-module">Detalle de la <b>Gestión</b> realizada para una <b>Solicitud</b> de <b>Viáticos</b></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="grid-margin stretch-card">
            <div class="card manage-apply">
                <p class="card-title">
                    <button class="btn-approve-item float-right mdi mdi-check" title="Aprobar" @click="apply(true)"></button>
                    <button class="btn-reject-item float-right mdi mdi-close-octagon" title="Rechazar" @click="apply(false)"></button>
                    <router-link to="/request/approve">
                        <button class="btn-back-item float-right mdi mdi-arrow-left" title="Volver">
                            <a href=""></a>
                        </button>
                    </router-link>
                </p>
                <div class="card-body">
                    <div class="">
                        <div class="card-body ">
                            <div class="row">
                                <div class="col-md-12">
                                    <view-head-detail-request :id_request="id"></view-head-detail-request>  
                                </div>                        
                            </div>                   
                        </div>
                        <div class="card-body ">
                            <div class="row">                       
                                <div class="col-md-12">
                                    <view-detail-rates-list :id_request="id"></view-detail-rates-list>  
                                </div>
                            </div>                   
                        </div>
                        <div class="card-body ">
                            <div class="row">                       
                                <div class="col-md-12">
                                    <view-detail-accredit :id_request="id"></view-detail-accredit>  
                                </div>
                            </div>                                    
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
    import Table from '../mixins/Table.js'
    import Util  from '../mixins/Util.js'
    export default {
        mixins: [Table, Util],
        data() {
            return {
                id                   : parseInt(this.$route.params.id),                
                errors               : {},
                qty                  : 0,
                staff_list           : {},
                type_management_list : {},
                type_management_id   : "",
                code_management_list : {},
                code_management_id   : "",
                management_list      : {},
                management_id        : "",
                rate_list            : [],
                rate_id              : "",
                projects: [{
                    folio       : "",
                    description : ""
                }],
                request              : {},
                tariff_total         : "",
                tariff_list_manage   : [],
                rates                : "",
                total_manage         : 0,
                total_manage_cash    : 0

            }
        },
        created() {
            this.getRequest()
            this.getListMangenent()
        },
        methods: {
            getRequest() {
                var self = this
                this.$http.get('/get-request', {
                        params: {
                            id: self.id
                        }
                    })
                    .then(response => {
                        self.request           = response.body.request
                        self.rates             = response.body.request.rates
                        self.total_manage      = response.body.total_request
                        self.total_manage_cash = self.total_manage + self.cash
                        self.loader            = false
                    }, response => {
                        self.$toasted.global.APP_GENERAL_ERROR()
                    })
            },
            getListMangenent() {
                var self = this
                this.$http.get('/list-types-management').then(function(response) {
                    self.type_management_list = response.body
                }, function() {
                    this.$toasted.global.APP_GENERAR_ERROR()
                })
            },
            changeTypeListManagement() {
                var self = this
                this.$http.get('/list-codes-management', {
                    params: {
                        type: self.type_management_id
                    }
                }).then(function(response) {
                    self.code_management_list = response.body
                }, function() {
                    this.$toasted.global.APP_GENERAR_ERROR()
                })
            },
            changeCodeListManagement() {

                var self = this
                this.$http.get('/list-management', {
                    params: {
                        code: self.code_management_id
                    }
                }).then(function(response) {
                    self.management_list = response.body
                }, function() {
                    this.$toasted.global.APP_GENERAR_ERROR()
                })
            },
            changeListManagement() {
                var self = this
                this.$http.get('/list-rate-management', {
                    params: {
                        management: self.management_id
                    }
                }).then(function(response) {
                    self.rate_list = response.body
                }, function() {
                    this.$toasted.global.APP_GENERAR_ERROR()
                })
            },
            changeTariffValues() {
                var self = this
                this.rate_list.forEach(function(row) {
                    if (row.id == self.rate_id) {
                        self.tariff_total = row.value * self.qty
                    }
                })
            },
            addTariffToList() {
                var type       = this.searchNameToList(this.type_management_list, this.type_management_id, 'label')
                var code       = this.searchNameToList(this.code_management_list, this.code_management_id, 'label')
                var management = this.searchNameToList(this.management_list, this.management_id, 'name')
                var rate       = this.searchNameToList(this.rate_list, this.rate_id, 'description')
                this.tariff_list_manage.push({
                    rate_id: this.rate_id,
                    qty        : this.qty,
                    value      : this.tariff_total,
                    type       : type,
                    code       : code,
                    management : management,
                    rate       : rate
                })
            },
            searchNameToList(list, id, value) {
                var name = ""
                list.forEach(function(row) {
                    if (row.id == id) {
                        if (value == 'description') {
                            name = row.description
                        } else if (value == 'label') {
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
                var index = this.tariff_list_manage.indexOf(row);
                if (index !== -1) {
                    this.tariff_list_manage.splice(index, 1);
                }
            },            
            apply (apply) {
                var action = apply ? 'Aprobar' : 'Rechazar'
                event.preventDefault()
                this.$swal({
                    input: 'text',
                    inputAttributes: {
                        autocapitalize: 'off',
                        placeholder: "Ingrese una Observación para el evento"
                    },
                    showCancelButton: true,
                    confirmButtonText: action,
                    cancelButtonText: 'Cancelar',
                    showLoaderOnConfirm: true,
                    preConfirm: (comment) => {
                        var data = {
                            _token  : this.csrf,
                            approve : apply,
                            id      : this.id,
                            comment : comment
                        }
                        var self = this
                        this.$http.post('/manage-approve-apply', data)
                            .then(response => {
                                self.$toasted.global.APP_GENERAL_SUCCESS()
                                self.$router.push({
                                    path: "/request/approve"
                                })
                            }, response => {
                                self.$toasted.global.APP_GENERAL_ERROR()
                            })
                    }
                })
            },
        },
        filters: {
            upper: function(value) {
                return value.toUpperCase();
            }
        },
        watch: {
            qty() {
                this.changeTariffValues()
            },
            rate_id() {
                this.changeTariffValues()
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