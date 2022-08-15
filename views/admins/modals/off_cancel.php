<div class="modal fade" id="cancel-off" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Từ chối yêu cầu nghỉ phép</h5>
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
                                    <label for="reason">Lý do từ chối: <span class="text-danger">*</span></label>
                                    <textarea class="form-control" rows="3" cols="10" name="reason" id="reason"></textarea>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="modal-footer" style="border: none;">
                    <button type="button" class="btn btn-primary" id="button-modal-cancel-off">Từ chối</button>
                </div>
            </div>
        </div>
    </div>
</div>
