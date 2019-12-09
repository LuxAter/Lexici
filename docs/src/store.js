import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    programs: ["Euler 1", "Euler 2", "Euler 3"],
    languages: ["Ada", "C++", "Fortran"]
  },
  mutations: {},
  actions: {}
});
