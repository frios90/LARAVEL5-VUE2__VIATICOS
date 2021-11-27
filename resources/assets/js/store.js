import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'
Vue.use(Vuex)

export default new Vuex.Store({
    state: {
        request: '',
        total_manage_request: 0,
        total_accredit: 0,

        widget_requests_moth : {}
    },
    mutations: {
        setRequest(state, resultRequest) {
            state.request = resultRequest 
        },
        setTotalManageRequest(state, resultRequest) {
            state.total_manage_request = resultRequest 
        },
        setTotalAccredit(state, resultRequest) {
            state.total_accredit = resultRequest 
        },
        setRequestWidgetRequestsMonth(state, resultRequest) {
            state.widget_requests_moth = resultRequest
        }
    },
    actions: {   
        async getRequest({commit}, request_id) {      
            try {            
                let data = await axios.get('/get-request', {
                    params: {
                        id: request_id
                    }
                })      
                commit('setRequest',            data.data.request) 
                commit('setTotalManageRequest', data.data.total_request) 
                commit('setTotalAccredit',      data.data.total_accredit) 

            } catch (error) {
            } finally {
            }       
        },
        async getWidgetRequestsMoth ({commit}, month) {
            try {            
                let data = await axios.get('/get-request', {
                    params: {
                        month: month
                    }
                })      
                commit('setRequestWidgetRequestsMonth', data.data) 
             
            } catch (error) {
            } finally {
            }       
        }
    },
    modules: {
    }
})
