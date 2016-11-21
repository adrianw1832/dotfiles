import ranger.api
import ranger.core.linemode
from devicons import *

@ranger.api.register_linemode
class MyLinemode(ranger.core.linemode.LinemodeBase):
    name = "filename"

    def filetitle(self, file, metadata):
        return devicon(file.relative_path) + '  ' + file.relative_path
