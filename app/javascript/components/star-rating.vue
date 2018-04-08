<template>
  <div class="star-rating">
    <div class="empty-stars"></div>
    <div class="full-stars" :style="this.starRatingStyle"></div>
  </div>
</template>

<script>
  export default {
    props: {
      rating: { type: String }
    },
    computed: {
      starRatingStyle() {
        var perc = this.rating / 5 * 100;
        return `width: ${perc}%`
      }
    }
  }
</script>

<style scoped>
  /* https://jsfiddle.net/4qqspqxh/ */

  .star-rating {
    position: relative;
    vertical-align: middle;
    display: inline-block;
    color: #b1b1b1;
    overflow: hidden;
  }

  .full-stars {
    position: absolute;
    left: 0;
    top: 0;
    white-space: nowrap;
    overflow: hidden;
    color: #fde16d;
  }

  .empty-stars:before, .full-stars:before {
    content: "\2605\2605\2605\2605\2605";
    font-size: 12pt;
  }

  .empty-stars:before {
    -webkit-text-stroke: 1px #848484;
  }

  .full-stars:before {
    -webkit-text-stroke: 1px orange;
  }

  /* Webkit-text-stroke is not supported on firefox or IE */

  /* Firefox */
   @-moz-document url-prefix() {
    .full-stars {
        color: #ECBE24;
    }
  }

  /* IE */
/*   <!--[if IE]> .full-stars {
      color: #ECBE24;
    }
  <![endif]-->*/
</style>
