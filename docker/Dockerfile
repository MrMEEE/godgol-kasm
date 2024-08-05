FROM kasmweb/core-ubuntu-focal:1.15.0
USER root

ENV HOME /home/kasm-default-profile
ENV STARTUPDIR /dockerstartup
ENV INST_SCRIPTS $STARTUPDIR/install
WORKDIR $HOME

######### Customize Container Here ###########

COPY dosbox-x/ /opt/dosbox-x

RUN ls -la /opt/dosbox-x

#RUN echo "/usr/bin/desktop_ready && /opt/dosbox-x/dosbox-x &" > $STARTUPDIR/custom_startup.sh \
#&& chmod +x $STARTUPDIR/custom_startup.sh

RUN apt update \
    && apt -y install libsdl-net1.2 libsdl2-net-2.0-0 libslirp0 libfluidsynth2 libavcodec-extra libavcodec-extra58 libxkbfile1  \
    && apt clean

# Update the desktop environment to be optimized for a single application
RUN cp $HOME/.config/xfce4/xfconf/single-application-xfce-perchannel-xml/* $HOME/.config/xfce4/xfconf/xfce-perchannel-xml/
RUN cp /usr/share/backgrounds/bg_kasm.png /usr/share/backgrounds/bg_default.png
RUN apt-get remove -y xfce4-panel

RUN echo "/usr/bin/desktop_ready && /dosbox/utils/bin/godgol-launch &" > $STARTUPDIR/custom_startup.sh \
&& chmod +x $STARTUPDIR/custom_startup.sh

######### End Customizations ###########

RUN chown 1000:0 $HOME
RUN $STARTUPDIR/set_user_permission.sh $HOME

ENV HOME /home/kasm-user
WORKDIR $HOME
RUN mkdir -p $HOME && chown -R 1000:0 $HOME

USER 1000
