<template >     
      <div class="content-wrapper">
        <div v-if="loader" class="loader"></div>
        <div class="row">
          <div class="col-md-12 grid-margin">
            <div class="d-flex justify-content-between flex-wrap">
              <div class="d-flex align-items-end flex-wrap">
                <div class="mr-md-3 mr-xl-5">
                  <h2>Bienvenido</h2>
                  <p class="mb-md-0">Sistema de <b>Gestión</b> y <b>Control</b> de <b>Gastos SOFAG</b></p>
                </div>
                <div class="d-flex">
                  <i class="mdi mdi-home text-muted hover-cursor"></i>
                  <router-link to="/home">
                    <a href=""><p class="text-primary mb-0 hover-cursor"></p></a>
                  </router-link>
                </div>
              </div>              
            </div>
          </div>
        </div>


        <div class="resumen">
          <div class="resument-1">
            <widget-total-requests-month></widget-total-requests-month>            
          </div>
          <div class="resument-2">

          </div>
          <div class="resument-3">
        </div>
          <div class="resument-4">

          </div>
          <div class="resument-5">

          </div>
        </div>

        <div>
          <div>
            <widget-requests-for-state></widget-requests-for-state>
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
                csrf: document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
                title: "Bienvenido",
                sub_title: "Sistema de control y gestión de gastos SOFAG",                
            
                }

        },
        created () {
          this.loader = false 
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
  .resumen {
    display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-template-rows: 1fr;
  grid-column-gap: 0px;
  grid-row-gap: 0px;
  }

  .resument-div1 { grid-area: 1 / 1 / 2 / 2; }
  .resument-div2 { grid-area: 1 / 2 / 2 / 3; }
  .resument-div3 { grid-area: 1 / 3 / 2 / 4; }
  
</style>
