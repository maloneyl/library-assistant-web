<template>
  <div class="book">
    <a :href="bookObj.link" target="_blank">
      <span class="link"></span>
    </a>
    <figure class="cover">
      <img :src="bookObj.image_url" alt="Book cover" />
    </figure>
    <div class="info">
      <div class="title">{{ bookObj.title }}</div>
      <div class="author">{{ bookObj.author }}</div>
      <div class="extras">{{ bookObj.year }} | {{ bookObj.average_rating }}</div>
    </div>
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
    background: hsl(360, 100%, 100%);
    margin: 0 1.5em 3em 1.5em;
    position: relative;
    max-width: 250px;

    &:hover {
      box-shadow: 3px 3px 8px hsl(0, 0%, 70%);
    }

    span.link {
      position: absolute;
      top: 0;
      left: 0;
      height: 100%;
      width: 100%;
    }

    figure.cover {
      margin: 0;
      width: 100%;

      img {
        width: 100%;
        height: 100%;
      }
    }

    .info {
      padding: 1.5em;
      text-align: center;
      line-height: 1.3;
      width: 100%;

      .title {
        font-weight: 700;
        font-size: 1.1em;
        margin-bottom: 0.3em;
      }

      .author {
        font-size: 1em;
        color: hsl(25, 100%, 45%);
        margin-bottom: 0.3em;
      }

      .extras {
        font-size: 0.8em;
        color: hsl(0, 0%, 40%);
      }
    }
  }

  @media only screen and (min-width: 40em) {
    .book {
      display: flex;
      max-width: 450px;
      flex: 1 1 0;

      figure.cover {
        min-width: 230px;
        max-width: 230px;
        height: 350px;
      }

      .info {
        display: flex;
        flex-direction: column;
        justify-content: center;
        flex-wrap: wrap;
      }
    }
  }
</style>
