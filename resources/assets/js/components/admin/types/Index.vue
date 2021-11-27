<template >     
      <div class="content-wrapper">
        <div v-if="loader" class="loader"></div>
        <div class="row">
          <div class="col-md-12 grid-margin">
            <div class="d-flex justify-content-between flex-wrap">
              <div class="d-flex align-items-end flex-wrap">
                <div class="mr-md-3 mr-xl-5">
                  <h2>Gestión de Tipos</h2>
                  <p class="mb-md-0">Listado completo de <b>Tipos</b> de <b>Agrupaciones de Códigos</b> para configuraciones de sistema.</p>
                </div>
                <view-navigation :list="'types_index'"></view-navigation>
              </div>
            </div>
          </div>
        </div>
        <div class="grid-margin stretch-card">           
          <div class="card">
            <p class="card-title">
              <router-link :to="{ name: 'type.create' }">
                <button class="btn-approve-item float-right mdi mdi-plus" title="Nuevo" ><a href=""></a></button>
              </router-link> 
            </p> 
            <div class="card-body">
              <p class="card-title"></p>
              <div id="people">
                <v-client-table  class="index-table" :data="tableData" 
                                :columns="columns" 
                                :options="options">
                  <span slot="actions" slot-scope="props">
                    <router-link v-if ="!props.row.deleted_at" :to="'/type/edit/'+ props.row.id"><i class="mdi mdi-tooltip-edit hover-cursor icon-edit "></i></router-link>
                    <i v-if ="!props.row.deleted_at" class="mdi mdi-checkbox-marked-circle hover-cursor" @click="changeStatus(props.row.id, '/type-status', '/types-table-list')"></i>
                    <i v-else class="mdi mdi-checkbox-blank-circle hover-cursor" @click="changeStatus(props.row.id, '/type-status', '/types-table-list')"></i>                  
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
    import Util from '../../mixins/Util.js'
    export default {
        mixins: [Table, Util],
        data () {
          return {          
          }
        },
        created () {
          this.getDataTable('/types-table-list')
            this.columns          =  ['name', 'label', 'actions']
            this.options.headings = {                
                name    : 'Código',
                label   : 'Nombre',
                actions : '',
            }
            this.options.sortable = ['label']
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
