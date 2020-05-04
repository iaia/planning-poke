<template>
  <div class="card issue-#{issue.id}">
    <div class="card-content">
      <span class="card-title">
        {{ issue.issue_number }}
      </span>
    </div>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
    }
  }
}
</script>
