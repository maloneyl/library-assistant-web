<template>
  <div class="book">
    <a :href="bookObj.link" target="_blank">
      <img :src="bookObj.image_url" />
      <div class="info">
        <h2>{{ bookObj.title }}</h2>
        <h3>{{ bookObj.author }}</h3>
      </div>
    </a>
  </div>
</template>

<script>
  export default {
    props: {
      bookObj: { type: Object }
    }
  }
</script>

<style lang="scss" scoped>
  .book {
    display: flex;
    background: hsl(360, 100%, 100%);
    margin-bottom: 3em;

    &:hover {
      box-shadow: 3px 3px 8px hsl(0, 0%, 70%);
    }

    a {
      text-decoration: none;
    }

    img {
      width: 100%;
      object-fit: contain;
    }

    .info {
      text-align: center;
    }
  }
</style>
