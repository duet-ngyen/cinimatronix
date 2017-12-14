<template>
  <div class="user-item">
    {{ user.name }} - {{ user.email }}
  </div>
</template>

<script>
  export default {
    props: ['user']
  }
</script>
