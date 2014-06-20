<div class="form-horizontal">
    <div class="control-group">
        How long is the line you just drew on the image?
    </div>
    <div class="control-group">
        <div class="controls">
            <g:textField class="input-small" name="pixelLength" value="${pixelLength}"/> pixels =
            <g:textField class="input-small" name="mmLength" value="${imageInstance?.mmPerPixel ?: ''}" />
            <g:select name="units" class="input-small" from="${['mm','inches', 'metres','feet']}" value="mm"/>
        </div>
    </div>
    <div class="control-group">
        <div class="controls">
            <button class="btn btn-primary" id="btnCalibrateImageScale">Save</button>
            <button class="btn" id="btnCancelCalibrateImageScale">Cancel</button>
        </div>
    </div>
</div>
<script>

    $("#btnCancelCalibrateImageScale").click(function(e) {
        e.preventDefault();
        imglib.hideModal();
    });

    $("#btnCalibrateImageScale").click(function(e) {
        e.preventDefault();
        var units = $("#units").val();
        var pixelLength = $("#pixelLength").val();
        var actualLength = $("#mmLength").val();
        $.ajax("${createLink(controller:'webService', action:'calibrateImageScale', params:[imageId: imageInstance.imageIdentifier])}&units=" + units + "&pixelLength=" + pixelLength + "&actualLength=" + actualLength).done(function() {
            imglib.hideModal();
        });
    });


</script>