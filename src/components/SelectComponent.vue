<template>
  <div class="mb-3">
    <label class="form-label">{{labelName}}</label>
    <select  class="form-select" v-model="value" v-on:change="changeEvent" required>
      <option
          v-for="option in options"
          :value="option"
          :key="option.id"
      >
        {{option.name}}
      </option>
    </select>
  </div>
</template>

<script>
export default {
  name: "SelectComponent",
  props: ['labelName', 'modelValue', 'changeEvent', 'options'],
  emits: ['update:modelValue'],
  computed: {
    value: {
      get() {
        return this.modelValue;
      },
      set(value) {
        this.$emit('update:modelValue', value);
      }
    }
  }
}
</script>

<style scoped>

</style>