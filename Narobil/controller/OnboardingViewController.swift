//
//  OnboardingViewController.swift
//  Narobil
//
//  Created by Dharmendria on 20/01/20.
//  Copyright © 2020 Dharmendria. All rights reserved.
//

import UIKit
@available(iOS 13.0, *)
class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titileLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var masukBtnView: UIButton!
    @IBOutlet weak var daftarBtnView: UIButton!
    @IBOutlet weak var demoBtnView: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupCollectionView()
        setupPageControl()
        setupButtonView()
    }
    
    private func setupCollectionView()
    {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.backgroundColor = .white
        collectionView.collectionViewLayout = layout
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    private func setupButtonView()
    {
        masukBtnView.layer.cornerRadius = 7
        masukBtnView.layer.shadowOpacity = 0.5
        masukBtnView.layer.shadowColor = UIColor.darkGray.cgColor
        daftarBtnView.layer.cornerRadius = 7
        daftarBtnView.layer.shadowOpacity = 0.5
        daftarBtnView.layer.shadowColor = UIColor.darkGray.cgColor
        demoBtnView.layer.cornerRadius = 7
        demoBtnView.layer.shadowOpacity = 0.5
        demoBtnView.layer.shadowColor = UIColor.darkGray.cgColor
    }
    
    private func setupPageControl()
    {
        pageControl.numberOfPages = Slide.collection.count
    }
    
    private func setupView()
    {
        view.backgroundColor = .white
    }
    
    @IBAction func getStartedButtonTapped(_ sender: UIButton)
    {
        performSegue(withIdentifier: K.Segue.showLoginSignUpScreen, sender: nil)
    }
    @IBAction func getRegisterButtonTapped(_ sender: UIButton)
    {
        performSegue(withIdentifier: K.Segue.showRegisterUpScreen, sender: nil)
    }
    
    private func showCaption(atIndex index:Int)
    {
        let slide = Slide.collection[index]
        titileLabel.text = slide.title
        descriptionLabel.text = slide.description
    }
}

@available(iOS 13.0, *)
extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Slide.collection.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! OnboardingCollectionViewCell
        let imageName = Slide.collection[indexPath.item].imageName
        let image = UIImage(named: imageName) ?? UIImage()
        cell.configure(image: image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return collectionView.frame.size;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
//    func scrollViewDidEndDecolerating(_ scrollView: UIScrollView) {
//        let index = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
//        print("index: \(index)")
//    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        showCaption(atIndex: index)
        pageControl.currentPage = index
    }
}

