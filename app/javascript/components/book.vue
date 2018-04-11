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
        <star-rating :rating="bookObj.average_rating" />
        <div class="rating">
          {{ bookObj.average_rating }}
        </div>
      </div>
      <div class="year">[{{ bookObj.year }}]</div>
    </div>
  </div>
</template>

<script>
  import StarRating from './star-rating.vue';

  export default {
    props: {
      bookObj: { type: Object }
    },
    components: { StarRating },
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
    position: relative;
    width: 320px;
    height: 280px;
    max-width: 90vw;
    overflow: hidden;
    border: 1px solid hsl(0, 0%, 80%);

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
      height: 100%;
      max-width: 60%;
      border-right: 1px solid hsl(0, 0%, 90%);

      img {
        height: 100%;
        width: 100%;
      }
    }

    .info {
      text-align: right;
      font-size: 0.8em;
      color: hsl(0, 0%, 40%);
      padding: 0.8em;

      .year {
        padding-top: 0.5em;
      }
    }
  }
</style>
