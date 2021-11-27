<template>
    <div class="content-wrapper">
        <!-- <div v-if="loader" class="loader"></div> -->
        <div class="row">
            <div class="col-md-12 grid-margin">
                <div class="d-flex justify-content-between flex-wrap">
                    <div class="align-items-end flex-wrap">
                        <view-navigation :list="'request_manage_accredit'"></view-navigation>            

                        <div class="mr-md-3 mr-xl-5">
                            <h2>Detalle de la Acreditación</h2>
                            <p class="mb-md-0 p-description-module">Detalle de los gastos Acreditados por colaboradores</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="grid-margin stretch-card">
            <div class="card manage-apply">
                <p class="card-title">
                    <router-link to="/request/manage">
                        <button class="btn-back-item float-right mdi mdi-arrow-left" title="Volver"></button>
                    </router-link>
                </p>
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
</template>
<script>
    import Util from '../mixins/Util.js'
    export default {
        mixins: [ Util],
        data() {
            return {
                id : parseInt(this.$route.params.id),
                
            }
        },
        
    }
</script>
@endsection