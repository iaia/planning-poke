<template>
  <div class="card">
    <div class="card-content">
      <form @submit.prevent="createIssue">
        <div class="input-field">
          <input id="issue_issue_number" name="issue[issue_number]" v-model="issue.issue_number">
          <label for="issue_issue_number">issue number</label>
        </div>
        <button type="submit" class="btn waves-effect waves-light">Create</button>
      </form>
    </div>
  </div>
</template>

<script>
export default {
}
</script>
