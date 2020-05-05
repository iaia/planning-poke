//import Vue from 'vue';
import Vue from "vue/dist/vue.esm"
import axios from 'axios';

//import App from './form_template.vue';

document.addEventListener("DOMContentLoaded", () => {
  axios.defaults.headers.common = {
    'X-Requested-With': 'XMLHttpRequest',
    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
  };
  const app = new Vue({
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
          this.issues.unshift(res.data);
        });
      },
      getIssues: function() {
        axios.get(`/issues`).then(res => {
          this.issues = res.data
        });
      }
    }
  })
});
