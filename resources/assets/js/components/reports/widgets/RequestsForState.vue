<template>
  <div class="widget-rfs">
    <div class="">
      <div class="">
        <div class="widget-rfs-title">
          Resumen de solicitudes por estado
        </div> 
        <div class="widget-rfs-select">
          <select class="widget-selector" v-model="month" @change="getWidgetRequestsMoth()">
            <option v-for="(m, mi) in months" :key="mi" :value="m.id">{{ m.label }}</option>
          </select>
        </div> 
      </div>
     
      <div class="">
        <div class="widget-rfs-detail">
          <div>
            <table class="widget-rfs-table">
              <tbody>
                <tr class="widget-rfs-tr" v-for="(d, key) of data" :key="key">
                  <td class="td-label-rfs">{{ d.status_label }}</td>
                  <td class="td-qty-rfs">{{ d.qty }}</td>
                </tr>               
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import Util from '../../mixins/Util.js'
  import axios from "axios"
  export default {
    mixins: [Util],
    props: {      
    },
    data() {
      return {
        month: this.initialMonth(),
        data: {},
        months: [
          {id: 1,  label: 'Enero'},
          {id: 2,  label: 'Febrero'},
          {id: 3,  label: 'Marzo'},
          {id: 4,  label: 'Abril'},
          {id: 5,  label: 'Mayo'},
          {id: 6,  label: 'Junio'},
          {id: 7,  label: 'Julio'},
          {id: 8,  label: 'Agosto'},
          {id: 9,  label: 'Septiembre'},
          {id: 10, label: 'Octubre'},
          {id: 11, label: 'Noviembre'},
          {id: 12, label: 'Diciembre'},
        ]   
      }
    },
    mounted () {   
      this.getWidgetRequestsMoth()  
    },
    methods: {    
    
      initialMonth () {
          var date = new Date()
          date = date.getMonth() + 1
          if (date > 12) {
              date = 1
          }       
          return date
      },
      async getWidgetRequestsMoth () {
        try {            
          let data = await axios.get('/get-requests-for-state-widget', {
              params: {
                  month: this.month
              }
          })      
          this.data = data.data    
          console.log(this.data)    
        } catch (error) {
        } finally {
        }       
      }
    },
    computed:{
      // ...mapState(['widget_requests_moth'])
    }  
  }
</script>

<style>
.widget-rfs {
  border-radius: 3px;
  padding: 15px;
  background-color: #fff;

  -webkit-box-shadow: 3px 3px 20px -1px rgba(204,204,204,1);
  -moz-box-shadow: 3px 3px 20px -1px rgba(204,204,204,1);
  box-shadow: 3px 3px 20px -1px rgba(204,204,204,1);

 margin: 10px;
  width: 270px;
}

.widget-rfs:hover {
  -webkit-filter: contrast(110%);
  filter: contrast(110%);
  transition: .5s;
}

.widget-rfs-title {
  font-weight: 600;
  font-size:13px;
  padding: 5px 5px;
}
.widget-rfs-table {
  width: 100%;
}
.td-qty-rfs {
  float: left;
  font-size: 20px; 
  color: #fff;
}
.td-label-rfs:hover {
  cursor: pointer;
  weight: 600;
  transition: .5s!important;
  -webkit-transform:scale(1.2);
  transform:scale(1.2);
}

.widget-rfs-select {
  padding: 0px 10px;
}

.widget-selector {
     background: transparent;
     border: none!important;
     border-bottom: solid 0.5px #00a19a!important;
     font-size: 14px;
     height: 30px;
     padding: 5px;
     width: 125px;
  }
</style>