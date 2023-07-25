<template>
  <div id="niveau-overview">
    <b-container class="mb-3 niv-container" fluid>
      <template v-for="n in niveauArray">
        <b-row :key="n" cols="3" class="niveau" :style="styleForLevel(n)">
          <b-col cols="2" class="l-niv">
            <span class="niv-name" style="display: flex; align-items: end; white-space: nowrap;">{{"Niveau " + n}}</span>
            <div style="width: 100%; height: 100%">
            <template v-for="(bar, key) in distributionForLevel(n)">
              <div :key="key" class="dist-bar" :style="bar"></div>
            </template>
            </div>
          </b-col>
          <b-col cols="6" lg="7" class="t-examples">
            <template v-for="(example, key) in examplesForLevel(n)">
              <div :key="key" class="example-div">
                <span>{{example.text}}</span>
                <img  v-if="example.image !== undefined" class="example-img" :src="example.image.filepath" :alt="'eine Beispielaufgabe für das Niveau' + n">
              </div>
            </template>
          </b-col>
          <b-col cols="4" lg="3" class="headline-col">
            <span class="explanation-tooltip">{{explanationForLevel(n)}}</span>
            <span class="headline">{{headlineForLevel(n)}}</span>
          </b-col>
        </b-row>
      </template>
    </b-container>
  </div>
</template>

<script>

const A = 'Anforderungsstufen'
const E = '_example'

export default {
  name: 'NiveauOverview',
  inject: ['testData'],
  props: {
    nivConfig: Object
  },
  data: function () {
    return {
      nivColors: [
        "#c6d3ec",
        "#b2efb2",
        "#ffffb2",
        "#ffebb2",
        "#ffb2b2"
      ],
      nivTextColors: [
        "#4270c2",
        "#00b04f",
        "#ffbf00",
        "#eb7d30",
        "#bf0000"
      ]
    }
  },
  computed: {
    exampleImages() {
      return this.testData?.info_attachments.filter(
          attachment => attachment.content_type.startsWith('image') && attachment.filename.startsWith(A + E)
      )
    },
    maxInDistribution() {
      const dist = this.nivConfig.distribution
      let max = Number.NEGATIVE_INFINITY
      for (var i = 0; i < dist.length; i++) {
        max = Math.max(max, ...dist[i])
      }
      return max
    },
    /** A decreasing list of niveau numbers, such as [4,3,2,1] for 4 niveaus.*/
    niveauArray() {
      const nivCount = this.nivConfig.distribution.length
      return [...Array(nivCount).keys()].map(x => x+1).reverse()
    }
  },
  methods: {
    examplesForLevel(level) {
      const example_texts = this.nivConfig.example_texts[level-1]
      const example_images = this.exampleImages.filter(img => img.filename.startsWith(A + E + level))
      // build examples from texts, adding images where appropriate
      let i = 1
      return example_texts.map(text => {
        const image = example_images.find(img => img.filename.startsWith(A + E + level + "_" + i))
        ++i
        return {text: text, image: image}
      })
    },
    headlineForLevel(level) {
      return this.nivConfig.headlines[level-1]
    },
    styleForLevel(level) {
      return {
        'color': this.nivTextColors[level-1],
        'background-color': this.nivColors[level-1],
        'height': this.nivConfig.heights[level-1]
      };
    },
    explanationForLevel(level) {
      return this.nivConfig.explanations[level-1]
    },
    distributionForLevel(level) {
      const levelDist = this.nivConfig.distribution[level-1]
      return levelDist.map(studentCount => {
        return { 'width': (studentCount / this.maxInDistribution) * 100 + "%", 'height': (1 / levelDist.length) * 100 + "%" }
      }).reverse()
    }
  },
}
</script>

<style>
#niveau-overview {
  width: 100%;
  //height: 38vw;
  margin: 2.3rem;
  font-weight: bold;
}
@media (max-width: 1400px) {
  #niveau-overview {
    margin: 2.3rem 1.15rem;
  }
}
@media (max-width: 992px) {
  #niveau-overview {
    margin: 2.3rem 0.5rem;
  }
}
.niv-container {
  height: 100%;
  max-width: 1800px;
  max-height: 1000px;
}
.niveau {
  //border-radius: 12px!important;
  //padding: 3px;
  border: 0 solid #b9b9b9;
  border-bottom-width: 1px;
}
.niveau:first-child {
  border-radius: 8px 8px 0 0;
}
.niveau:last-child {
  border-radius: 0 0 8px 8px;
  border-width: 0;
}
.dist-bar {
  margin: 0 0 0 auto;
  padding: 1px 0 1px 0;
  display: block;
  background-color: #FFFFFFFF;
  border: 1px solid #797979;
}
.t-examples {
  padding: 0 !important;
  display: flex;
  flex-wrap: wrap;
  flex-direction:column;
  background-color: white;
  color: black;
  height: 100%;
  max-width: 100%;
  overflow: scroll;
  //border-radius: 6px;
}
.l-niv {
  flex-wrap: nowrap;
  height: 100%;
  padding: 0 0 0 0.6rem !important;
  position: relative;
  display: flex;
}
@media (max-width: 892px) {
  .niv-name {
    align-self: center;
    writing-mode: vertical-rl;
    text-orientation: upright;
    margin-right: 3px;
  }
}
.headline-col {
  display: flex;
  padding: 0.2rem;
  position: relative;
  height: 100%;
}
.headline {
  display: flex;
  align-self: center;
  max-height: 100%;
  overflow: scroll;
}
.example-div {
/* take up half the space, leading to two columns of examples being shown */
  display: flex;
  flex-flow: column;
  width: 50%;
  max-height: 100%;
  padding: 10px 1em;
  font-weight: normal;
  white-space: pre-wrap;
}
@media (max-width: 992px) {
  .example-div {
    /* take up the full space, leading to only one column of examples being shown */
    width: 100%;
  }
}
.example-img {
  padding-top: 4px;
  padding-bottom: 0;
  margin-left: auto;
  margin-right: auto;
  object-fit: contain;
  width: auto;
  max-width: 100%;
  min-height: 0;
  max-height: 100%;
}
.explanation-tooltip {
  left: -0.1rem;
  top: 0;
  white-space: pre-wrap;
  background-color: #f5f5f5;
  color: black;
  font-weight: 400;
  border: 1px solid rgba(0, 0, 0, 0.225);
  border-radius: 4px;
  padding: 11px;
  position: absolute;
  width: 115%;
  transform: translate(-100%, 0%);
  visibility: hidden;
  z-index: 999;
  opacity: 0;
  transition: opacity 0.4s;
}
@media (max-width: 1150px) {
  .explanation-tooltip {
    width: 200%;
  }
}
.headline-col:hover .explanation-tooltip {
  visibility: visible;
  opacity: 1;
}
</style>
