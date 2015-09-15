module LabelStatusHelper
  LABEL_TYPES = {
    new:      "label_admin label-info",
    process:  "label_admin label-warning",
    pay_ok:   "label_admin label-success",
    pay_error: "label_admin label-danger"
  }.freeze

  def status_label(status)
    LABEL_TYPES[status.to_sym] if status
  end
end
