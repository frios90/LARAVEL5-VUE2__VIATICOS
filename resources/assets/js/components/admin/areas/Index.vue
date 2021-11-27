<template >     
      <div class="content-wrapper">
        <div v-if="loader" class="loader"></div>
        <div v-if="mostrar_contenido" class="row"> 
          <div class="col-md-12 grid-margin">
            <div class="d-flex justify-content-between flex-wrap">
              <div class="d-flex align-items-end flex-wrap">
                <div class="mr-md-3 mr-xl-5">
                  <h2>Gestión de Areas</h2>
                  <buttom class="btn-approve-item" @click="apretando_boton()">apreta</buttom>
                    {{ apretado }}
                  <p class="mb-md-0">Listado completo de <b>Areas</b> en el sistema.</p>
                </div>
                <div class="d-flex">
                  <i class="mdi mdi-home text-muted hover-cursor"></i>


                  <router-link to="/home">
                    <a href=""><p class="text-muted mb-0 hover-cursor">&nbsp;/&nbsp;inicio&nbsp;/&nbsp;</p></a>
                  </router-link>

                  
                  <p class="text-primary mb-0 hover-cursor">usuarios</p>
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
                <v-client-table  class="index-table" :data="tableData" :columns="columns" :options="options">


                  <span slot="actions" slot-scope="props">

                    

                    <router-link v-if ="!props.row.deleted_at" :to="'/users/edit/'+props.row.id">
                      <i class="mdi mdi-tooltip-edit icon-edit hover-cursor"></i>
                    </router-link>
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
               apretado : 'inicio del apretado',
              mostrar_contenido: true,
              csrf: document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
                         
          }
        },
        created () {
           
            console.log('estoy creando')
            this.getDataTable('/areas-table-list')
            this.columns          =  ['rut', 'name', 'email', 'area_id', 'profile_id', 'actions', 'test']
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

              this.testDos()
        },
        mounted () {
          console.log('estoy montando')
          this.test()
        },
        methods: {
          apretando_boton () {
            this.apretado = 'el boton se apreto. toooma'
          },
          test () {
            console.log('estiy en el test')
          },
          testDos () {
            console.log()
          } 
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
