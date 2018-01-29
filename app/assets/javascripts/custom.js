document.addEventListener("turbolinks:load", function() {
        $('.datepicker').datepicker({format: "yyyy-mm-dd"});
        $('#editor').froalaEditor();

    $(function() {
        $('#unpublished').click(function(event){
            event.preventDefault();
            $('#np').toggle();
        });
    });
});