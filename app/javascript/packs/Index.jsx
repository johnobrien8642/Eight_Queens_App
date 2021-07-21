// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from 'react';
import ReactDom from 'react-dom';
import 'bootstrap/dist/css/bootstrap.min.css';
import $ from 'jquery';
import Popper from 'popper.js';
import 'bootstrap/dist/js/bootstrap.bundle.min';
import Root from './Root';
import '../../assets/stylesheets/application.css';

document.addEventListener('DOMContentLoaded', () => {
  var div = document.createElement('div')
  div.className = 'homepage container'

  ReactDom.render(
    <Root name="React" />,
    document.body.appendChild(div),
  )
})
