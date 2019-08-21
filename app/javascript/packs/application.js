/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

//Javascript
import 'jquery'
import 'bootstrap'   //Javascript Teile von Bootstrap
import Rails from 'rails-ujs' //Rails-UJS für Links etc.

//Vue und Komponenten
import Vue from 'vue'
import BootstrapVue from 'bootstrap-vue'

//Eigene Vue Komponenten
import ClassBookApp from './classbook/classbook-app'
import FrontendApp from './testing/frontend-app'
import HomeApp from './home/home-app'
import MaterialsApp from './materials/materials-app'
import StudentView from './testing/student-view'


//Stylesheets
import "@fortawesome/fontawesome-free/css/all.css" //FontAwesome für Icons
import 'bootstrap/dist/css/bootstrap.css' //Bootstrap-Styles
import 'bootstrap-vue/dist/bootstrap-vue.css'

//Selbst definierte Styles
import 'css/application.css'

//Vorbereitungscode

window.$ = $;          //JQuery für den Rest der Seite verfügbar machen. Alternative ggf. über Expose-Loader
Rails.start();         //Rails-ujs für die SPAs verfügbar machen

Vue.use(BootstrapVue);

//Setup für Vue-SPAs

document.addEventListener('DOMContentLoaded', () => {
    const element = document.getElementById('levumi');
    if (element != null) {
        const data = JSON.parse(element.getAttribute('data'));
        const backend = new Vue({
            el: '#levumi',
            data: data,
            components: {
                ClassBookApp,
                FrontendApp,
                HomeApp,
                MaterialsApp,
                StudentView
            }
        });
    }
});

