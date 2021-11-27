<template>
    <div class="content-wrapper">   
        <div v-if="loader" class="loader"></div>     
        <div class="row">
            <div class="col-md-12 grid-margin">
                <div class="d-flex justify-content-between flex-wrap">
                    <div class="align-items-end flex-wrap">
                        <view-navigation :list="'index_request'"></view-navigation>
                        <div class="mr-md-3 mr-xl-5">
                            <h2>Solicitudes</h2>
                            <p class="mb-md-0 p-description-module">
                                Módulo en el cual toda persona que necesite realizar algún evento con demanda de gastos por concepto
                                de viajes y viáticos, podrá detallar cada aspecto de este, con el fin de que se pueda, previo analisis y
                                gestión, entregar un estimado de dinero con el cual poder mantenerse durante la o las jornadas extraordinarias.  

                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="grid-margin stretch-card">
            <div class="card">
                <p class="card-title">
                    <router-link :to="{ name: 'request.user.create' }">
                        <button class="btn-approve-item float-right mdi mdi-plus" title="Nuevo">
                            <a href=""></a>
                        </button>
                    </router-link>
                </p>
                <div class="card-body">
                    <div id="people">
                        <v-client-table class="index-table" :data="tableData" :columns="columns" :options="options">
                            <span slot="actions" slot-scope="props">                
                                <router-link :to="'/request/user/see/'+props.row.id">
                                <i class="mdi mdi-eye hover-cursor icon-see" title="Ver"></i>
                                </router-link>
                                <router-link :to="'/request/user/accredit/'+props.row.id" v-if ="props.row.status_code === 'MANAGEMENT_APPROVE' || props.row.status_code === 'REQUEST_ACCREDITED'">
                                <i class="mdi mdi-animation hover-cursor icon-accreditation" title="Acreditar"></i>
                                </router-link>
                                <router-link :to="'/request/user/edit/'+props.row.id" v-if =" props.row.status_code === 'PENDING_APPROVAL' || props.row.status_code === 'REQUEST_REJECTED'">
                                <i class="mdi mdi-tooltip-edit hover-cursor icon-edit" title="Editar"></i>
                                </router-link>                
                            </span>
                        </v-client-table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
    import Table from '../mixins/Table.js'
    import Util from '../mixins/Util.js'
    export default {
        mixins: [Table, Util],        
        created() {
            this.getDataTable('/request-user-table-list')
            this.columns          = ['folio', 'cash', 'rank_date', 'status_label', 'actions']
            this.options.headings = {                
                folio        : 'Folio',
                cash         : 'Efectivo',
                rank_date    : 'Fechas',
                status_label : 'Estado',
                actions      : '',
            }
            this.options.sortable = ['folio']
        }
    }
</script>
@endsection
