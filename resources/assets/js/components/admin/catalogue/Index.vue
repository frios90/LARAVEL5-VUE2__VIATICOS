<template >     
  <div class="content-wrapper">
    <div v-if="loader" class="loader"></div>
    <div class="row">
      <div class="col-md-12 grid-margin">
        <div class="d-flex justify-content-between flex-wrap">
          <div class="align-items-end flex-wrap">
            <view-navigation :list="'catalogue_index'"></view-navigation>
            <div class="mr-md-3 mr-xl-5">
              <h2>Banco de Empresas</h2>
              <p class="mb-md-0 p-description-module">
                Módulo para la gestión de empresas de las cuales se tenga información alguna que sirva
                para realizar la estimación de gastos sobre una solicitud.
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="grid-margin stretch-card">           
      <div class="card">
        <p class="card-title">
          <router-link :to="{ name: 'catalogue.create' }">
            <button class="btn-approve-item float-right mdi mdi-plus" title="Nuevo" ><a href=""></a></button>
          </router-link> 
        </p> 
        <div class="card-body">
          <p class="card-title"></p>
          <div id="people">
            <v-client-table class="index-table" :data="tableData" 
                            :columns="columns" 
                            :options="options">
              <span slot="actions" slot-scope="props">
                <router-link v-if ="!props.row.deleted_at" title="Editar" :to="'/catalogue/edit/'+ props.row.id"><i class="mdi mdi-tooltip-edit hover-cursor icon-edit"></i></router-link>
                <router-link v-if ="!props.row.deleted_at" title="Ir a Tarifas" :to="'/catalogue/'+ props.row.id +'/rates'"><i class="mdi mdi-square-inc-cash hover-cursor icon-edit "></i></router-link>
                <i v-if ="!props.row.deleted_at" title="Cambiar Estado" class="mdi mdi-checkbox-marked-circle hover-cursor" @click="changeStatus(props.row.id, '/catalogue-status', '/catalogue-table-list')"></i>
                <i v-else class="mdi mdi-checkbox-blank-circle hover-cursor" @click="changeStatus(props.row.id, '/catalogue-status', '/catalogue-table-list')"></i>                  
              </span>                                                     
            </v-client-table>
          </div>
        </div> 
      </div>  
    </div>
  </div>          
</template>
<script>
    import Table from '../../mixins/Table.js'
    import Util  from '../../mixins/Util.js'
    export default {
      mixins: [Util, Table],
      data () {
      return {
        csrf : document.querySelector('meta[name="csrf-token"]').getAttribute('content')               
      }
    },
    created () {
      this.getDataTable('/catalogue-table-list')
      this.columns          =  ['rut', 'name', 'code.label', 'actions']
      this.options.headings = {                
          rut          : 'Rut',
          name         : 'Nombre',
          'code.label' : 'Tipo',
          actions      : ''
      }
      this.options.sortable = [
          'rut',
          'name'
        ]
    },
    methods: { 
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
</style>
