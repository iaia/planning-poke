//import Vue from 'vue';
import Vue from "vue/dist/vue.esm"
import axios from 'axios';

//import App from './form_template.vue';

document.addEventListener("DOMContentLoaded", () => {
  axios.defaults.headers.common = {
    'X-Requested-With': 'XMLHttpRequest',
    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
  };
  const roomVm = new Vue({
    el: "#issue-form",
    data: {
      issue: {
        issue_number: ""
      },
      issues: [
      ]
    },
    methods: {
      createIssue: function() {
        axios.post(`/issues.json`, {
          issue_number: this.issue.issue_number
        }).then(res => {
          this.issue.issue_number = ""
          //this.issues.unshift(res.data);
        });
      },
      getIssues: function() {
        axios.get(`/issues`).then(res => {
          console.log(res.data)
          this.issues = res.data
        });
      },
      setEstimate: function(issue_id, point) {
        axios.post(`/issues/` + issue_id + `/estimates.json`, {
          point: point
        }).then(res => {
          /*
           *  TODO: 選んだestimateをactiveにしたい
           *  this.issues.forEach(item => {
           *    if (item.id === res.issue_id) {
           *      item[:estimate] = res
           *    }
           *  });
          */
        });
      }
    },
    mounted() {
      this.getIssues()
    }
  })
  window.app = roomVm;
});
