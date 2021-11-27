<template>
    <div class="content-wrapper">
        <div v-if="loader" class="loader"></div>
        <div class="row">
            <div class="col-md-12 grid-margin">
                <div class="d-flex justify-content-between flex-wrap">
                    <div class="align-items-end flex-wrap">
                        <view-navigation :list="'request_approve_see'"></view-navigation>

                        <div class="mr-md-3 mr-xl-5">
                            <h2>Vista general de la solicitud</h2>
                            <p class="mb-md-0 p-description-module">Información completa de la solicitud una vez acreditada</b></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="grid-margin stretch-card">
            <div class="card">
                <p class="card-title">
                    <router-link to="/request/approve">
                        <button class="btn-back-item float-right mdi mdi-arrow-left" title="Volver"></button>
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
    import 'sweetalert2/dist/sweetalert2.min.css';
    import Table from '../mixins/Table.js'
    import Util from '../mixins/Util.js'

    export default {
        mixins : [Table, Util],
        data() {
            return {
            }
        },
        mounted() {
            this.loader = false
        },
        methods: {
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
                        this.$http.post('/request-approve-apply', data)
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