<div class="modal fade" id="add-off" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Thêm yêu cầu nghỉ phép</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <form>
                                <div class="form-group">
                                    <label for="start_date">Ngày bắt đầu: <span class="text-danger">*</span></label>
                                    <input type="date" class="form-control" id="start_date" name="start_date">
                                </div>
                                <div class="form-group">
                                    <label for="end_date">Ngày kết thúc: <span class="text-danger">*</span></label>
                                    <input type="date" class="form-control" id="end_date" name="end_date">
                                </div>
                                <div class="form-group">
                                    <label for="type">Hình thức nghỉ: <span class="text-danger">*</span></label>
                                    <select class="form-control" id="type" name="type">
                                        <option value="0">Nghỉ buổi sáng</option>
                                        <option value="1">Nghỉ buổi chiều</option>
                                        <option value="2">Nghỉ cả ngày</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="content">Lý do nghỉ: <span class="text-danger">*</span></label>
                                    <textarea class="form-control" rows="3" cols="10" name="content" id="content"></textarea>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="modal-footer" style="border: none;">
                    <button type="button" class="btn btn-primary" id="button-modal-add-off">Thêm</button>
                </div>
            </div>
        </div>
    </div>
</div>
