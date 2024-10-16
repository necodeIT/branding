.PHONY: all clean

SRCDIR = src
BUILDDIR = out

SVGFILES_IN = $(wildcard $(SRCDIR)/*.svg)
PNGFILES_IN = $(wildcard $(SRCDIR)/*.png)

SVGFILES_OUT = $(patsubst $(SRCDIR)/%.svg, $(BUILDDIR)/%.svg, $(SVGFILES_IN))

PNGFILES_OUT = \
	$(patsubst $(SRCDIR)/%.svg, $(BUILDDIR)/%.svg.png, $(SVGFILES_IN)) \
	$(patsubst $(SRCDIR)/%.png, $(BUILDDIR)/%.png, $(PNGFILES_IN))

all: $(BUILDDIR) $(SVGFILES_OUT) $(PNGFILES_OUT)

$(BUILDDIR):
	mkdir -p "$(BUILDDIR)"

$(BUILDDIR)/%.svg.png: $(SRCDIR)/%.svg
	resvg "$<" "$@"
$(BUILDDIR)/%.svg: $(SRCDIR)/%.svg
	cp "$<" "$@"
$(BUILDDIR)/%.png: $(SRCDIR)/%.png
	cp "$<" "$@"
clean :
	rm -drf $(BUILDDIR)