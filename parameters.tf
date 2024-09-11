resource "aws_ssm_parameter" "lb_arn" {
    name = ""
    value = aws_lb.main.arn
    type = "string"
}

resource "aws_ssm_parameter" "lb_listener" {
    name = ""
    value = aws_lb_listener.main.arn
    type = "string"
}