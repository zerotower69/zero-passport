<template>
<div :style="dynamicStyle"></div>
</template>

<script>
export default {
  name: 'Triangle',
  props: ['size', 'color', 'direction', 'rotate'],
  computed: {
    dynamicStyle () {
      const styles = { width: '0', height: '0' }
      styles.transform = `rotate(${this.rotate}deg)`
      if (['left', 'right'].includes(this.direction)) {
        styles.borderTop = `${this.size}px solid transparent`
        styles.borderBottom = `${this.size}px solid transparent`
        if (this.direction === 'left') {
          styles.borderRight = `${this.size}px solid ${this.color}`
        } else if (this.direction === 'right') {
          styles.borderLeft = `${this.size}px solid ${this.color}`
        }
      } else if (['top', 'bottom'].includes(this.direction)) {
        styles.borderLeft = `${this.size}px solid transparent`
        styles.borderRight = `${this.size}px solid transparent`
        if (this.direction === 'top') {
          styles.borderBottom = `${this.size}px solid ${this.color}`
        } else if (this.direction === 'bottom') {
          styles.borderTop = `${this.size}px solid ${this.color}`
        }
      }
      return styles
    }
  }
}
</script>

<style scoped>

</style>
