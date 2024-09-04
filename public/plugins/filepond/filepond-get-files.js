/*!
 * FilePondPluginGetFile 1.1.0
 * Licensed under MIT, https://opensource.org/licenses/MIT/
 * Please visit undefined for details.
 */

/* eslint-disable */

(function (global, factory) {
   typeof exports === 'object' && typeof module !== 'undefined'
      ? (module.exports = factory())
      : typeof define === 'function' && define.amd
         ? define(factory)
         : ((global =
            typeof globalThis !== 'undefined' ? globalThis : global || self),
            (global.FilePondPluginGetFile = factory()));
})(this, function () {
   'use strict';

   /**
    * Register the download component by inserting the download icon
    */
   const registerDownloadComponent = (
      item,
      el,
      labelButtonDownload,
      allowDownloadByUrl,
      downloadFunction
   ) => {
      // Create button element
      const button = document.createElement('button');
      button.className = 'filepond--file-action-button filepond--action-remove-item';
      button.type = 'button';
      button.style.paddingBottom = '10px';
      button.style.visibility = 'visible';
      button.dataset.align = 'right';
      button.style.zIndex = '5'; // Set the z-index

      button.title = 'Preview File'; // Tooltip text for the button
      // Create img element for the image
      const img = document.createElement('img');
      img.src = 'http://127.0.0.1:8000/img/open_file.png'; // Set the image URL
      img.width = '15';
      img.height = '15';
      if (typeof item.source === 'object') {
         button.style.visibility = 'hidden';
         // item.source is an object
         console.log('item.source is an object');
     } else if (typeof item.source === 'string') {
         // item.source is a string
         button.style.visibility = 'visible';
         console.log('item.source is a string');
     } else {
         // item.source is neither an object nor a string
         console.log('item.source is neither an object nor a string');
     }
     

      img.alt = 'Remove'; // Optional: Set alternative text for accessibility
      // Append the img element to the button
      button.appendChild(img);

      // Create span element for the text
      const span = document.createElement('span');
      span.textContent = 'Remove';

      // Append the span element to the button
      button.appendChild(span);

      // Create div element to contain the button
      const fileDiv = document.querySelector('.filepond--file');

      // Insert the button into the div
      fileDiv.appendChild(button);
      button.addEventListener('click', () =>
         openFile(item, allowDownloadByUrl, downloadFunction)
      );
   };

   function openFile(item, allowDownloadByUrl, downloadFunction) {
      let array = ['docx', 'doc', 'xlsx', 'xls'];

      let ext = item.fileExtension.toLowerCase().trim();
      if (array.includes(ext)) {
         window.open(item.serverId, '_blank');
      }
      else if (ext == "pdf") {
         let host = window.location.host;
         window.open("http://" + host + "/viewpdf/web/viewer.html?url=" + item.serverId, '_blank');
         
      } else {
         window.open(item.serverId, '_blank');
      }


   }





   /**
    * Download Plugin
    */
   const plugin = (fpAPI) => {
      const { addFilter, utils } = fpAPI;
      const { Type, createRoute } = utils;

      // called for each view that is created right after the 'create' method
      addFilter('CREATE_VIEW', (viewAPI) => {
         // get reference to created view
         const { is, view, query } = viewAPI;

         // only hook up to item view
         if (!is('file')) {
            return;
         }

         // create the get file plugin
         const didLoadItem = ({ root, props }) => {
            const { id } = props;
            const item = query('GET_ITEM', id);
            if (!item || item.archived) {
               return;
            }
            const labelButtonDownload = root.query(
               'GET_LABEL_BUTTON_DOWNLOAD_ITEM'
            );
            const allowDownloadByUrl = root.query('GET_ALLOW_DOWNLOAD_BY_URL');
            const downloadFunction = root.query('GET_DOWNLOAD_FUNCTION');
            registerDownloadComponent(
               item,
               root.element,
               labelButtonDownload,
               allowDownloadByUrl,
               downloadFunction
            );
         };

         // start writing
         view.registerWriter(
            createRoute(
               {
                  DID_LOAD_ITEM: didLoadItem,
               },
               ({ root, props }) => {
                  const { id } = props;
                  const item = query('GET_ITEM', id);

                  // don't do anything while hidden
                  if (root.rect.element.hidden) return;
               }
            )
         );
      });

      // expose plugin
      return {
         options: {
            labelButtonDownloadItem: ['Download file', Type.STRING],
            allowDownloadByUrl: [false, Type.BOOLEAN],
            downloadFunction: [null, Type.FUNCTION],
         },
      };
   };

   // fire pluginloaded event if running in browser, this allows registering the plugin when using async script tags
   const isBrowser =
      typeof window !== 'undefined' && typeof window.document !== 'undefined';
   if (isBrowser) {
      document.dispatchEvent(
         new CustomEvent('FilePond:pluginloaded', {
            detail: plugin,
         })
      );
   }

   return plugin;
});