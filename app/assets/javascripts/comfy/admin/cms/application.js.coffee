#= require jquery
#= require jquery_ujs
#= require jquery-ui
#= require codemirror
#= require codemirror/modes/css
#= require codemirror/modes/htmlmixed
#= require codemirror/modes/javascript
#= require codemirror/modes/markdown
#= require codemirror/modes/xml
#= require codemirror/addons/edit/closetag
#= require comfy/admin/cms/lib/bootstrap-datetimepicker
#= require comfy/admin/cms/lib/diff
#= require comfy/admin/cms/lib/redactor
#= require comfy/admin/cms/lib/redactor/filemanager
#= require comfy/admin/cms/lib/redactor/imagemanager
#= require comfy/admin/cms/lib/redactor/table
#= require comfy/admin/cms/lib/redactor/video
#= require_directory ./lib/redactor/i18n/
#= require comfy/admin/cms/base
#= require comfy/admin/cms/uploader
#= require comfy/admin/cms/files
#= require comfy/admin/cms/custom
#= require bootstrap-sprockets
#= require bootstrap

window.CMS.wysiwyg = ->
  csrf_token = $('meta[name=csrf-token]').attr('content');
  csrf_param = $('meta[name=csrf-param]').attr('content');
  if (csrf_param != undefined && csrf_token != undefined)
    params = csrf_param + "=" + encodeURIComponent(csrf_token)

  $('textarea[data-rich-text]').redactor
    minHeight: 400
    buttonSource: true
    buttons: ['html', 'formatting', '|', 'bold', 'italic', '|', 'unorderedlist', 'orderedlist', '|', 'image', 'link']
    imageUpload: $('.cms-files-modal').data('iframe-src') + '?ajax=1'
    imageGetJson: $('.cms-files-modal').data('iframe-src') + '?ajax=1'
    formattingTags: ['p', 'h1', 'h2', 'h3', 'h4']

