<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<document type="com.apple.InterfaceBuilder3.CocoaTouch.Storyboard.XIB" version="3.0" toolsVersion="5056" systemVersion="13E28" targetRuntime="iOS.CocoaTouch" propertyAccessControl="none" initialViewController="3To-ac-7wr">
    <dependencies>
        <plugIn identifier="com.apple.InterfaceBuilder.IBCocoaTouchPlugin" version="3733"/>
    </dependencies>
    <scenes>
        <!--Map View Controller-->
        <scene sceneID="ufC-wZ-h7g">
            <objects>
                <viewController id="vXZ-lx-hvc" customClass="MapViewController" sceneMemberID="viewController">
                    <view key="view" contentMode="center" id="mw6-db-wt8" userLabel="View">
                        <rect key="frame" x="0.0" y="0.0" width="320" height="568"/>
                        <autoresizingMask key="autoresizingMask" widthSizable="YES" heightSizable="YES"/>
                        <subviews>
                            <imageView opaque="NO" clearsContextBeforeDrawing="NO" contentMode="scaleAspectFit" horizontalHuggingPriority="251" verticalHuggingPriority="251" placeholderIntrinsicWidth="100" placeholderIntrinsicHeight="100" image="Map_yc" id="HGx-Dk-R96" userLabel="UIImage View map">
                                <rect key="frame" x="0.0" y="0.0" width="320" height="568"/>
                                <autoresizingMask key="autoresizingMask" widthSizable="YES" heightSizable="YES"/>
                                <gestureRecognizers/>
                            </imageView>
                        </subviews>
                        <color key="backgroundColor" white="1" alpha="1" colorSpace="custom" customColorSpace="calibratedWhite"/>
                        <gestureRecognizers/>
                        <connections>
                            <outletCollection property="gestureRecognizers" destination="IUm-tz-6KF" appends="YES" id="q90-ki-yzo"/>
                            <outletCollection property="gestureRecognizers" destination="Nji-t0-JIN" appends="YES" id="WbI-Cp-PE9"/>
                        </connections>
                    </view>
                    <navigationItem key="navigationItem" id="xrN-z3-NXt">
                        <barButtonItem key="leftBarButtonItem" systemItem="camera" id="ymp-pt-i4l" userLabel="Bar Button Item - AR"/>
                        <barButtonItem key="rightBarButtonItem" systemItem="organize" id="hn6-oc-njt" userLabel="Bar Button Item - ChoseMap">
                            <connections>
                                <segue destination="U3S-4p-VRo" kind="push" id="fFe-HW-VMP"/>
                            </connections>
                        </barButtonItem>
                    </navigationItem>
                    <connections>
                        <outlet property="mapView" destination="HGx-Dk-R96" id="eZS-C5-5zZ"/>
                    </connections>
                </viewController>
                <placeholder placeholderIdentifier="IBFirstResponder" id="x5A-6p-PRh" sceneMemberID="firstResponder"/>
                <panGestureRecognizer minimumNumberOfTouches="1" id="IUm-tz-6KF">
                    <connections>
                        <action selector="panGesture:" destination="vXZ-lx-hvc" id="Yr8-yn-yIE"/>
                    </connections>
                </panGestureRecognizer>
                <pinchGestureRecognizer id="Nji-t0-JIN">
                    <connections>
                        <action selector="pinchGesture:" destination="vXZ-lx-hvc" id="Pj9-Hb-KfC"/>
                        <outlet property="delegate" destination="vXZ-lx-hvc" id="m3d-03-hDf"/>
                    </connections>
                </pinchGestureRecognizer>
            </objects>
            <point key="canvasLocation" x="973" y="138"/>
        </scene>
        <!--MapList Table View Controller-->
        <scene sceneID="TXD-Qd-9wS">
            <objects>
                <tableViewController id="U3S-4p-VRo" userLabel="MapList Table View Controller" customClass="MapListTableViewController" sceneMemberID="viewController">
                    <tableView key="view" opaque="NO" clipsSubviews="YES" clearsContextBeforeDrawing="NO" contentMode="scaleToFill" alwaysBounceVertical="YES" dataMode="prototypes" style="plain" separatorStyle="default" rowHeight="44" sectionHeaderHeight="22" sectionFooterHeight="22" id="rze-Sy-eGG">
                        <rect key="frame" x="0.0" y="0.0" width="320" height="568"/>
                        <autoresizingMask key="autoresizingMask" widthSizable="YES" heightSizable="YES"/>
                        <color key="backgroundColor" white="1" alpha="1" colorSpace="calibratedWhite"/>
                        <prototypes>
                            <tableViewCell contentMode="scaleToFill" selectionStyle="blue" hidesAccessoryWhenEditing="NO" indentationLevel="1" indentationWidth="0.0" reuseIdentifier="MapListCell" textLabel="IXJ-GC-Jxm" detailTextLabel="YSQ-Ik-4Pu" style="IBUITableViewCellStyleValue1" id="Vv2-yJ-Fhd">
                                <rect key="frame" x="0.0" y="86" width="320" height="44"/>
                                <autoresizingMask key="autoresizingMask"/>
                                <tableViewCellContentView key="contentView" opaque="NO" clipsSubviews="YES" multipleTouchEnabled="YES" contentMode="center" tableViewCell="Vv2-yJ-Fhd" id="P7q-lv-NdQ">
                                    <rect key="frame" x="0.0" y="0.0" width="320" height="43"/>
                                    <autoresizingMask key="autoresizingMask"/>
                                    <subviews>
                                        <label opaque="NO" clipsSubviews="YES" multipleTouchEnabled="YES" contentMode="left" text="Title" lineBreakMode="tailTruncation" baselineAdjustment="alignBaselines" adjustsFontSizeToFit="NO" id="IXJ-GC-Jxm">
                                            <rect key="frame" x="15" y="11" width="33" height="21"/>
                                            <autoresizingMask key="autoresizingMask"/>
                                            <fontDescription key="fontDescription" type="system" pointSize="17"/>
                                            <color key="textColor" cocoaTouchSystemColor="darkTextColor"/>
                                            <nil key="highlightedColor"/>
                                        </label>
                                        <label opaque="NO" clipsSubviews="YES" multipleTouchEnabled="YES" contentMode="left" text="Detail" textAlignment="right" lineBreakMode="tailTruncation" baselineAdjustment="alignBaselines" adjustsFontSizeToFit="NO" id="YSQ-Ik-4Pu">
                                            <rect key="frame" x="261" y="11" width="44" height="21"/>
                                            <autoresizingMask key="autoresizingMask"/>
                                            <fontDescription key="fontDescription" type="system" pointSize="17"/>
                                            <color key="textColor" red="0.55686274509803924" green="0.55686274509803924" blue="0.57647058823529407" alpha="1" colorSpace="calibratedRGB"/>
                                            <nil key="highlightedColor"/>
                                        </label>
                                    </subviews>
                                </tableViewCellContentView>
                            </tableViewCell>
                        </prototypes>
                        <connections>
                            <outlet property="dataSource" destination="U3S-4p-VRo" id="h0f-Jm-wLK"/>
                            <outlet property="delegate" destination="U3S-4p-VRo" id="SSm-yP-NyB"/>
                        </connections>
                    </tableView>
                    <navigationItem key="navigationItem" title="室内图列表" id="pgc-Us-URd">
                        <barButtonItem key="rightBarButtonItem" systemItem="add" id="zMp-F2-uLH">
                            <connections>
                                <segue destination="rTQ-di-rzi" kind="push" identifier="" id="GQy-iY-Jeq"/>
                            </connections>
                        </barButtonItem>
                    </navigationItem>
                </tableViewController>
                <placeholder placeholderIdentifier="IBFirstResponder" id="4X7-87-xo3" userLabel="First Responder" sceneMemberID="firstResponder"/>
            </objects>
            <point key="canvasLocation" x="1453" y="138"/>
        </scene>
        <!--Add Map Info View Controller-->
        <scene sceneID="hSz-l6-c5G">
            <objects>
                <viewController id="rTQ-di-rzi" userLabel="Add Map Info View Controller" customClass="AddMapInfoViewController" sceneMemberID="viewController">
                    <view key="view" contentMode="scaleToFill" id="Av8-xu-hOK">
                        <rect key="frame" x="0.0" y="0.0" width="320" height="568"/>
                        <autoresizingMask key="autoresizingMask" flexibleMaxX="YES" flexibleMaxY="YES"/>
                        <subviews>
                            <textField opaque="NO" clipsSubviews="YES" contentMode="scaleToFill" contentHorizontalAlignment="left" contentVerticalAlignment="center" borderStyle="roundedRect" placeholder="MapName" textAlignment="center" minimumFontSize="17" id="ek6-Y4-lU3">
                                <rect key="frame" x="20" y="179" width="280" height="30"/>
                                <autoresizingMask key="autoresizingMask" flexibleMaxX="YES" flexibleMaxY="YES"/>
                                <fontDescription key="fontDescription" type="system" pointSize="14"/>
                                <textInputTraits key="textInputTraits"/>
                            </textField>
                            <textField opaque="NO" clipsSubviews="YES" contentMode="scaleToFill" contentHorizontalAlignment="left" contentVerticalAlignment="center" borderStyle="roundedRect" placeholder="Major" textAlignment="center" minimumFontSize="17" id="kuM-jD-q2T">
                                <rect key="frame" x="20" y="269" width="280" height="30"/>
                                <autoresizingMask key="autoresizingMask" flexibleMaxX="YES" flexibleMaxY="YES"/>
                                <nil key="textColor"/>
                                <fontDescription key="fontDescription" type="system" pointSize="14"/>
                                <textInputTraits key="textInputTraits"/>
                            </textField>
                        </subviews>
                        <color key="backgroundColor" white="1" alpha="1" colorSpace="custom" customColorSpace="calibratedWhite"/>
                    </view>
                    <navigationItem key="navigationItem" id="DMe-tZ-KP6">
                        <barButtonItem key="leftBarButtonItem" systemItem="cancel" id="2Wj-iX-2Br">
                            <connections>
                                <segue destination="x8a-Wy-ynv" kind="unwind" unwindAction="unwindAddMap:" id="jdp-pr-fK2"/>
                            </connections>
                        </barButtonItem>
                        <barButtonItem key="rightBarButtonItem" systemItem="save" id="ykF-Ih-gi7">
                            <connections>
                                <segue destination="x8a-Wy-ynv" kind="unwind" unwindAction="unwindAddMap:" id="Id2-tM-ou6"/>
                            </connections>
                        </barButtonItem>
                    </navigationItem>
                    <connections>
                        <outlet property="major" destination="kuM-jD-q2T" id="bdI-T3-JWx"/>
                        <outlet property="mapName" destination="ek6-Y4-lU3" id="eaA-aN-ghw"/>
                        <outlet property="saveButton" destination="ykF-Ih-gi7" id="GKg-aS-bTH"/>
                    </connections>
                </viewController>
                <placeholder placeholderIdentifier="IBFirstResponder" id="Jc2-tS-f3V" userLabel="First Responder" sceneMemberID="firstResponder"/>
                <exit id="x8a-Wy-ynv" userLabel="Exit" sceneMemberID="exit"/>
            </objects>
            <point key="canvasLocation" x="1995" y="138"/>
        </scene>
        <!--Navigation Controller-->
        <scene sceneID="287-zF-Aly">
            <objects>
                <navigationController automaticallyAdjustsScrollViewInsets="NO" id="3To-ac-7wr" sceneMemberID="viewController">
                    <toolbarItems/>
                    <navigationBar key="navigationBar" contentMode="scaleToFill" id="4St-BD-Cvf">
                        <rect key="frame" x="0.0" y="0.0" width="320" height="44"/>
                        <autoresizingMask key="autoresizingMask"/>
                    </navigationBar>
                    <nil name="viewControllers"/>
                    <connections>
                        <segue destination="vXZ-lx-hvc" kind="relationship" relationship="rootViewController" id="RgU-wy-wqt"/>
                    </connections>
                </navigationController>
                <placeholder placeholderIdentifier="IBFirstResponder" id="Rbc-JY-jNl" userLabel="First Responder" sceneMemberID="firstResponder"/>
            </objects>
            <point key="canvasLocation" x="497" y="138"/>
        </scene>
    </scenes>
    <resources>
        <image name="Map_yc" width="2067" height="2469"/>
    </resources>
    <simulatedMetricsContainer key="defaultSimulatedMetrics">
        <simulatedStatusBarMetrics key="statusBar"/>
        <simulatedOrientationMetrics key="orientation"/>
        <simulatedScreenMetrics key="destination" type="retina4"/>
    </simulatedMetricsContainer>
</document>
