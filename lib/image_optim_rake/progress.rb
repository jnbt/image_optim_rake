require "powerbar"

module ImageOptimRake
  class Progress < PowerBar
    PROGRESS_TEMPLATE = "${<msg>} ${[<bar>] } \e[33;1m${<percent>%} \e[36;1m${<elapsed>}"

    def initialize(options = {})
      super(options).tap do |progress|
        finite = progress.settings.tty.finite

        finite.template.main    = PROGRESS_TEMPLATE
        finite.template.padchar = " "
        finite.template.barchar = "="
        finite.template.exit    = "\e[?25h\e[0m"
        finite.template.close   = "\e[?25h\e[0m\n"
        finite.output           = lambda { |s| $stderr.print(s) }
      end
    end

    def show(options, force = true)
      super(options, force)
    end

  end
end
