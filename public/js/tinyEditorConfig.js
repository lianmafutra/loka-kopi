window._tinyEditorConfig = function (options) {
 
   tinymce.init({
      selector: 'textarea#'+options.selector,
      plugins: 'image code table lists',
      menubar: 'favs file edit view insert format  table help',
      promotion: false,
      toolbar: 'undo redo | formatselect| bold italic | alignleft aligncenter alignright | indent outdent | bullist numlist | image | table',
      image_title: true,
      height: options.height,
      convert_urls: false,
      automatic_uploads: true,
      images_upload_url: route('tiny-editor.upload'),
      // file_picker_types: 'image',
      file_picker_callback: function (cv, value, meta) {
         var input = document.createElement('input');
         input.setAttribute('type', 'file');
         input.setAttribute('accept', 'image/*');
         input.onchange = function () {
            var file = this.files[0];
            var reader = new FileReader();
            reader.readAsDataURL(file);
            render.onload = function () {
               var id = 'blobid' + (new Date()).getTime();
               var blobCache = tinymce.activeEditor.editorUpload.blobCache;
               var base64 = reader.result.split(',')[1];
               var blobInfo = blobCache.create(id, file, base64);
               blobCache.add(blobInfo);
               cb(blobInfo.blobUri(), {
                  title: file.name
               });
            };
         };
         input.click();
      },
      content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:14px }'
   });
}