<template>
  <div class="book">
    <a :href="bookObj.link" target="_blank">
      <span class="link"></span>
    </a>
    <figure class="cover">
      <img :src="bookObj.image_url" :alt="this.bookCoverAltText" />
    </figure>
    <div class="info">
      <div class="average-rating">
        <rating :rating="bookObj.average_rating" />
        {{ bookObj.average_rating }}
      </div>
      <div class="year">[{{ bookObj.year }}]</div>
    </div>
  </div>
</template>

<script>
  import Rating from './rating.vue';

  export default {
    props: {
      bookObj: { type: Object }
    },
    components: { Rating },
    computed: {
      bookCoverAltText() {
        return `${this.bookObj.title} | ${this.bookObj.author}`
      }
    }
  }
</script>

<style lang="scss" scoped>
  .book {
    background: hsl(360, 100%, 100%);
    margin: 0 1.5em 3em 1.5em;
    position: relative;
    width: 270px;
    height: 270px;
    overflow: hidden;

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
      float: left;

      img {
        max-height: 270px;
      }
    }

    .info {
      text-align: right;
      font-size: 0.8em;
      color: hsl(0, 0%, 40%);
      padding: 0.5em;

      .year {
        padding-top: 0.5em;
      }
    }
  }
</style>
