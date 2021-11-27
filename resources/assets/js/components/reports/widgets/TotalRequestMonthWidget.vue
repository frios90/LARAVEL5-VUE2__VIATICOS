<template>
  <div class="widget">
    <div class="widget-rm">
      <div class="widget-rm-div1">
        <div class="widget-rm-title">
          Total Solicitudes
        </div> 
        <div class="widget-rm-select">
          <select class="widget-selector" v-model="month" @change="getWidgetRequestsMoth()">
            <option v-for="(m, mi) in months" :key="mi" :value="m.id">{{ m.label }}</option>
          </select>
        </div> 
      </div>
      <div class="widget-rm-div2">
        <div class="widget-rm-qty">
          {{data_month.qty}}
        </div>
      </div>
      <div class="widget-rm-div3">
        <div class="widget-rm-detail">
          <div>
            <span class="title">Efectivo</span>  <span class="value">{{ data_month.total_cash | currency }}</span>
          </div>
          <div>
            <span class="title">Gestión</span> <span class="value">{{ data_month.total_manage | currency }}</span>
          </div>
          <div class="total">
            <span class="title">Total</span> <span class="value">{{ data_month.total_cash + data_month.total_manage | currency }}</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Util from '../../mixins/Util.js'
// import {mapState, mapMutations, mapActions} from "vuex"
import axios from "axios"

export default {
  mixins: [Util],
  props: {      
  },
  data() {
    return {
      month: this.initialMonth(),
      data_month: {},
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
    // ...mapMutations(['setRequestWidgetRequestsMonth']),
    // ...mapActions(['getWidgetRequestsMoth'])    
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
                let data = await axios.get('/get-info-widgets-requests-month', {
                    params: {
                        month: this.month
                    }
                })      
                this.data_month = data.data
                
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
.widget {
  border-radius: 3px;
  padding: 15px;
  background-color: #fff;

  -webkit-box-shadow: 3px 3px 20px -1px rgba(204,204,204,1);
  -moz-box-shadow: 3px 3px 20px -1px rgba(204,204,204,1);
  box-shadow: 3px 3px 20px -1px rgba(204,204,204,1);

  background: rgb(0,161,154);
  background: linear-gradient(338deg, rgba(0,161,154,1) 0%, rgba(51,180,174,1) 0%, rgba(255,255,255,1) 100%); 
  margin: 10px;
}

.widget:hover {

  -webkit-filter: contrast(110%);
  filter: contrast(110%);
  transition: .5s;
}

.widget-rm-title {
  font-weight: 600;
  color: #666;
  font-size:13px;
  padding: 5px 5px;
}

.widget-rm-qty {
  padding:10% 50%;
  font-size: 30px; 
  color: #fff;
}

.widget-rm-select {
  padding: 0px 10px;
}

.widget-rm-detail {
    padding: 5px 5px;
}
.widget-rm-detail .title {
  color: #fff;
  font-size:11px;
}
.widget-rm-detail .value {
  color: #fff;
  font-size:12px;
  float: right;
  font-weight: 600;
}
.widget-rm-detail .total {
}

.widget-rm {
  display: grid;
  grid-template-columns: 0.8fr 0.8fr 1.4fr;
  grid-template-rows: 1fr;
  grid-column-gap: 0px;
  grid-row-gap: 0px; 
}

.widget-rm-div1 { grid-area: 1 / 1 / 2 / 2; }
.widget-rm-div2 { grid-area: 1 / 2 / 2 / 3; }
.widget-rm-div3 { grid-area: 1 / 3 / 2 / 4; } 

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