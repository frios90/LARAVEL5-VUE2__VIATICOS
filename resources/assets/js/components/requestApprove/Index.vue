<template>
    <div class="content-wrapper">
        <div v-if="loader" class="loader"></div>
        <div class="row">
            <div class="col-md-12 grid-margin">
                <div class="d-flex justify-content-between flex-wrap">
                    <div class="align-items-end flex-wrap">
                        <view-navigation :list="'request_approve_index'"></view-navigation>

                        <div class="mr-md-3 mr-xl-5">
                            <h2>Módulo de análisis y aprobación de solicitudes</h2>
                            <p class="mb-md-0  p-description-module">Módulo para la <b>Gestión</b> de <b>Aprobacion</b> evolución de una <b>Solicitud</b></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <p class="card-title"></p>
                    <div id="people">
                        <v-client-table class="index-table" :data="tableData" :columns="columns" :options="options">
                            <span slot="actions" slot-scope="props">
                                <router-link :to="'/request/approve/see/'+props.row.id">
                                    <i class="mdi mdi-bell-ring-outline hover-cursor icon-see" title="Aprobar solicitud" v-if ="props.row.code.name === 'PENDING_APPROVAL'"></i>
                                </router-link>
                                <router-link :to="'/request/approve/approve-manage/'+props.row.id">
                                    <i class="mdi mdi-bell-ring hover-cursor icon-see" title="Aprobar gestión" v-if =" props.row.code.name === 'REQUEST_MANAGED'"></i>
                                </router-link> 
                                <router-link :to="'/request/approve/see-final/'+props.row.id">
                                    <i class="mdi mdi-album hover-cursor icon-see" title="Vista general de la solicitud" v-if ="props.row.code.name === 'REQUEST_ACCREDITED'"></i>
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
        data() {
            return {             
            }
        },
        created() {
            this.getDataTable('/request-approve-table-list')
            this.columns          = ['folio', 'code.label', 'user.name', 'going_at', 'return_at', 'actions']
            this.options.headings = {
                        folio: 'Folio',
                        
                        'user.name': 'Usuario',
                        'code.label': 'Estado',
                        going_at: 'Ida',
                        return_at: 'Vuelta',
                        actions: '',
                    }
            this.options.sortable = ['folio']
        },
        computed: {
            rows() {
                return this.items.length
            }
        }
    }
</script>
@endsection
<style>
    .mdi-checkbox-marked-circle {
        color: green;
    }
    
    .mdi-checkbox-blank-circle {
        color: red;
    }
    
    .mdi-tooltip-edit {
        color: blue;
    }
</style>