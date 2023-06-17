<section class="form-group" id="${id}">
<div class="row">
    <div class="col-xs-4 col-md-4 col-sm-4 col-lg-4">
   <label>
                Câu trả lời <span class="style2">(*)</span>                
              </label>
</div>
<div class="col-xs-5 col-md-5 col-sm-5 col-lg-5 text-right">
 <div class="form-check">
                <input class="form-check-input ckbUseCKEditor" type="checkbox" name="${optName}" value="">
                <label class="form-check-label">Sử dụng trình soạn thảo</label>
            </div>`
</div>
    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 text-right">
    <label><input type="radio" name="rbtOption" style="accent-color: #0E92B9;margin-right:5px;"
    option += checked ? `checked` : `
    option += readonly ? ` disabled>` : `>
    Là đáp án đúng</label>
    </div>
    </div>

    <div class="input-group">

    <textarea data-option="${id}" name="${optName}" 
        class="form-control custom-control" 
        rows="2" style="resize: vertical;" ${readonly ? 'readonly' : ''}></textarea>
        <span type="submit" class="input-group-addon btn btn-secondary btnRemoveOption" 
        name="btnRemoveOption" ${readonly ? 'disabled' : ''}>
        <i class="fa fa-times" aria-hidden="true"></i></span>

    </div>

    <span class="error"></span>
    </section>