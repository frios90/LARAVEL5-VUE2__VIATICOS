<template >
  <div class="content-wrapper">
    <div v-if="loader" class="loader"></div>
    <div class="row">
      <div class="col-md-12 grid-margin">
        <div class="d-flex justify-content-between flex-wrap">
          <div class="align-items-end flex-wrap">
            <view-navigation :list="'request_manage_index'"></view-navigation>

            <div class="mr-md-3 mr-xl-5">
              <h2>Gestión de Solicitudes</h2>
              <p class="mb-md-0 p-description-module">Módulo para la <b>Gestión</b> de <b>Gastos Estimados</b> sobre una <b>Solicitud</b></p>
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
                <router-link :to="'/request/manage/apply/'+props.row.id">
                 
                  <i title="Gestionar solicitud" class="mdi mdi-attachment hover-cursor icon-edit" v-if =" props.row.code.name === 'REQUEST_APPROVED'"></i>
                </router-link>   
                <router-link :to="'/request/manage/see-accreditation/'+props.row.id">
                  <i title="Gestionar acreditación" class="mdi mdi-animation hover-cursor icon-see" v-if =" props.row.code.name === 'REQUEST_ACCREDITED'"></i>
                </router-link>
                <router-link :to="'/request/manage/edit/' + props.row.id">
                  <i title="Editar gestión" class="mdi mdi-tooltip-edit hover-cursor icon-see" v-if =" props.row.code.name === 'MANAGEMENT_REJECTED' || props.row.code.name === 'REQUEST_MANAGED'"></i>
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
        data () {
            return {
          }
        },
        created () {
            this.getDataTable('/request-manage-table-list')
            this.columns          = ['folio', 'user.name', 'going_at', 'return_at','code.label', 'actions']
            this.options.headings = {
                    folio: 'Folio',
                    'user.name': 'Usuario',
                    going_at: 'Ida',
                    return_at: 'Vuelta',
                    'code.label': 'Estado',
                    actions: '',
                  }
            this.options.sortable = ['folio']
        },
        filters: {
          upper: function (value) {
              return value.toUpperCase();
          }
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
  color:green;
}
.mdi-checkbox-blank-circle {
  color:red;
}
.mdi-tooltip-edit {
  color: blue;
}
</style>
