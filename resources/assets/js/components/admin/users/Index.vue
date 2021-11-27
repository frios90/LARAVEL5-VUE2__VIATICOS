<template >     
      <div class="content-wrapper">
        <div v-if="loader" class="loader"></div>
        <div class="row">
          <div class="col-md-12 grid-margin">
            <div class="d-flex justify-content-between flex-wrap">
              <div class="align-items-end flex-wrap">
                <view-navigation :list="'users_index'"></view-navigation>

                <div class="mr-md-3 mr-xl-5">
                  <h2>Gestión de usuarios</h2>
                  <p class="mb-md-0 p-description-module">
                    Módulo para la gestión de usuarios dentro de la plataforma.
                  </p>
                </div>

              </div>              
            </div>
          </div>
        </div>
        <div class="grid-margin stretch-card">           
          <div class="card">
            <p class="card-title">
              <router-link :to="{ name: 'user.create' }">
                <button class="btn-approve-item float-right mdi mdi-plus" title="Nuevo" ><a href=""></a></button>
              </router-link> 
            </p>  
            <div class="card-body">
              <div id="people">
                <v-client-table  class="index-table" :data="tableData" 
                                :columns="columns" 
                                :options="options">
                  <span slot="actions" slot-scope="props">
                    <router-link v-if ="!props.row.deleted_at" :to="'/users/edit/'+props.row.id"><i class="mdi mdi-tooltip-edit icon-edit hover-cursor"></i></router-link>
                    <i v-if ="!props.row.deleted_at" class="mdi mdi-checkbox-marked-circle hover-cursor" @click="changeStatus(props.row.id, '/user-status', '/users-table-list')"></i>
                    <i v-else class="mdi mdi-checkbox-blank-circle hover-cursor" @click="changeStatus(props.row.id, '/user-status', '/users-table-list')"></i>                  
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
              csrf: document.querySelector('meta[name="csrf-token"]').getAttribute('content')               
          }
        },
        created () {
            this.getDataTable('/users-table-list')
            this.columns          =  ['rut', 'name', 'email', 'area_id', 'profile_id', 'actions']
            this.options.headings = {                
                rut        : 'Rut',
                name       : 'Nombre',
                email      : 'Correo',
                area_id    : 'Área',
                profile_id : 'Perfil',
                actions    : '',
            }
            this.options.sortable = [
                'rut'               
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
