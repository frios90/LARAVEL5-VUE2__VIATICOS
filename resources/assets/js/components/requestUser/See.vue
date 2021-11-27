<template>
    <div class="content-wrapper">
        <div class="row">
            <div class="col-md-12 grid-margin">
                <div class="d-flex justify-content-between flex-wrap">
                    <div class="align-items-end flex-wrap">
                        <view-navigation :list="'see_request'"></view-navigation>
                        <div class="mr-md-3 mr-xl-5">
                            <h2>Detalle de la Solicitud</h2>
                            <p class="mb-md-0 p-description-module">Detalle completo de la Solicitud</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="grid-margin stretch-card">
            <div class="card">
                <p class="card-title">
                    <router-link to="/request/user">
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
    import Util from '../mixins/Util.js'
    export default {
        mixins: [Util]
    }
</script>
@endsection