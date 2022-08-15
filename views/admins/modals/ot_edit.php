<div class="modal fade" id="edit-ot" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Cập nhật yêu cầu tăng ca</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <form>
                                <input type="hidden" name="id">
                                <div class="form-group">
                                    <label for="date">Ngày tăng ca: <span class="text-danger">*</span></label>
                                    <input type="date" class="form-control" id="date" name="date">
                                </div>
                                <div class="form-group">
                                    <label for="hour">Số giờ dự kiến: <span class="text-danger">*</span></label>
                                    <input type="number" class="form-control" id="hour" name="hour" min=1>
                                </div>
                                <div class="form-group">
                                    <label for="content">Lý do tăng ca: <span class="text-danger">*</span></label>
                                    <textarea class="form-control" rows="3" cols="10" name="content" id="content"></textarea>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="modal-footer" style="border: none;">
                    <button type="button" class="btn btn-primary" id="button-modal-edit-ot">Cập nhật</button>
                </div>
            </div>
        </div>
    </div>
</div>
